class ApiController < ActionController::API
  include ExceptionHandler
  include Pagination

  before_action :authenticate_request!, :current_consumer
  after_action :set_security_headers

  protected

  def set_security_headers
    response.set_header('Referrer-Policy', referrer_policy) if referrer_policy.present?
    response.set_header('X-XSS-Protection', x_xss_protection) if x_xss_protection.present?
    response.set_header('Strict-Transport-Security', strict_transport) if strict_transport.present?
  end

  private

  def current_consumer
    @current_consumer ||= authentication_manager.current_consumer
  end

  def authenticate_request!
    authentication_manager.authenticate_request!
  end

  def authentication_manager
    @authentication_manager ||= AuthenticationManager.new(request.headers)
  end

  def referrer_policy
    request.headers['Referrer-Policy']
  end

  def x_xss_protection
    request.headers['X-XSS-Protection']
  end

  def strict_transport
    request.headers['Strict-Transport-Security']
  end
end
