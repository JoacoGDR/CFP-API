module Api
  class SpeciesController < ApiController
    include OrderHandler

    def create
      create_species
      render_created_message
    end

    def show
      render json: single_species, serializer: SingleSpeciesSerializer
    end

    def index
      return order_params_errors unless valid_order_params?

      render_paginated ordered_species, root_key: :species, serializer: SpeciesSerializer
    end

    private

    def render_created_message
      render json: { message: 'Species successfully created', url: species_url(@new_species) },
             status: :created
    end

    def create_params
      params.require(:species).permit(:name)
    end

    def create_species
      @new_species = Species.create!(create_params)
    end

    def single_species
      Species.includes(:catch_quota_allocations, :catch_quotas, :catches)
             .find(params.require(:id))
    end

    def filtered_species
      Species.by_quotated_status(quotated?)
    end

    def ordered_species
      ordered_collection filtered_species
    end

    def quotated?
      return nil if filter_params[:quotated].blank?

      filter_params[:quotated].to_b
    end

    def filter_params
      params.permit(:quotated)
    end

    def order_attributes
      %w[name created_at]
    end
  end
end
