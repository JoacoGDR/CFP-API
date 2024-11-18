module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActionController::UnpermittedParameters, with: :render_unpermitted_parameters
    rescue_from Exceptions::MissingCredentials, with: :render_missing_credentials
    rescue_from Exceptions::InvalidCredentials, with: :render_invalid_credentials
  end

  private

  def render_error(message = nil, meta: nil, status: :bad_request)
    render json: { error: message, meta: meta }, status: status
  end

  def render_parameter_missing(error)
    render_error(error.message, status: :bad_request)
  end

  def render_not_found(error)
    render_error(error.message, status: :not_found)
  end

  def render_unpermitted_parameters(error)
    render_error(error.message, status: :bad_request)
  end

  def render_missing_credentials(error)
    render_error(error.message, status: :unauthorized)
  end

  def render_invalid_credentials(error)
    render_error(error.message, status: :unauthorized)
  end
end
