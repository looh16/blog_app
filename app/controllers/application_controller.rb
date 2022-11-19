class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def json_response(json, status)
    render json:, status:
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name photo bio])
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
