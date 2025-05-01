module Api
  class VesselsController < ApiController
    include OrderHandler

    def index
      return order_params_errors unless valid_order_params?

      render_paginated ordered_vessels, root_key: :vessels, serializer: VesselSerializer
    end

    def show
      render json: single_vessel, serializer: DetailedVesselSerializer
    end

    def create
      new_vessel = Vessel.create!(vessel_params)
      render_created_message(new_vessel)
    end

    def add_ownership_change
      vessel.vessel_ownership_changes.create!(ownership_change_params)
      update_vessel_owner
      render_ownership_change_message
    end

    private

    def
    def(_vessel_params)
      params.require(:vessel).require(:name, :registration_code).permit(:company_id)
    end

    def render_ownership_change_message
      render json: { message: 'Ownership change successfully created',
                     url: api_vessel_url(vessel) },
             status: :created
    end

    def vessel
      @vessel ||= Vessel.find(params.require(:id))
    end

    def change_vessel_owner
      new_owner = vessel.vessel_ownership_changes.order(change_date: :desc).last.new_owner
      vessel.update!(company: new_owner)
    end

    def ownership_change_params
      params.require(:ownership_change).permit(:new_owner_id, :previous_owner_id, :change_date)
    end

    def index_params
      params.permit(%i[company_id business_group_id]).to_h
    end

    def single_vessel
      Vessel.includes(:vessel_name_changes, :vessel_ownership_changes,
                      :sanctions, :catches, :catch_quotas).find(params.require(:id))
    end

    def filtered_vessels
      Vessel.by_company(index_params[:company_id])
            .by_group(index_params[:business_group_id])
    end

    def ordered_vessels
      ordered_collection filtered_vessels
    end

    def order_attributes
      %w[name registration_code created_at]
    end

    def vessel_params
      params.require(:vessel).permit(:name, :registration_code)
    end
  end
end
