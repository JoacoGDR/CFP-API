require 'rails_helper'
RSpec.describe Api::SpeciesController, type: :controller do
  describe 'GET #index' do
    subject(:get_species) { get :index, params: params }

    let(:params) { { page: page, page_size: page_size, quotated: quotated }.compact }
    let(:page) { nil }
    let(:page_size) { nil }
    let(:quotated) { nil }

    context 'when authenticated' do
      include_context 'with authenticated consumer'

      before do
        create_list(:species, 2)
        create(:species, :with_quotas)
        get_species
      end

      let(:collection_key) { 'species' }
      let(:expected_species_keys) { %w[id name] }

      context 'when the pagination params are present' do
        let(:page) { 2 }
        let(:page_size) { 2 }
        let(:expected_page_size) { 1 }

        it_behaves_like 'basic index endpoint with pagination'
      end

      context 'when the pagination params are not present' do
        let(:expected_page_size) { Species.count }

        it_behaves_like 'basic index endpoint with pagination'
      end

      context 'when the quotated param is passed' do
        context 'when quotated is true' do
          let(:quotated) { true }
          let(:expected_page_size) { 1 }

          it_behaves_like 'basic index endpoint with pagination'
        end

        context 'when quotated is false' do
          let(:quotated) { false }
          let(:expected_page_size) { 2 }

          it_behaves_like 'basic index endpoint with pagination'
        end
      end

      it 'returns a serialized collection of species' do
        expect(response_body[collection_key].sample.keys).to match_array(expected_species_keys)
      end
    end

    context 'when not authenticated' do
      it 'returns unauthorized' do
        get_species
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'GET #show' do
    subject(:get_single_species) { get :show, params: { id: species_id } }

    let(:species_id) { species.id }
    let(:species) { create(:species, :with_quotas) }

    context 'when authenticated' do
      include_context 'with authenticated consumer'

      before { get_single_species }

      let(:expected_keys) { %w[id name catch_quota_allocations catch_quotas catches] }

      it_behaves_like 'basic show endpoint'
    end

    context 'when not authenticated' do
      it 'returns unauthorized' do
        get_single_species
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
