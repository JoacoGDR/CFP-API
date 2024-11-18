require 'rails_helper'
RSpec.describe Api::SpeciesController, type: :controller do
  describe 'GET #index' do
    subject(:get_species) { get :index, params: { page: page, per_page: per_page } }

    let(:page) { 2 }
    let(:per_page) { 2 }

    context 'when authenticated' do
      include_context 'with authenticated consumer'

      before do
        create_list(:species, 3)
        get_species
      end

      let(:expected_page_size) { 1 }
      let(:expected_species_keys) { %w[id name] }
      let(:collection_key) { 'species' }

      it_behaves_like 'basic index endpoint with pagination'

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
end
