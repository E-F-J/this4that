class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :index]
   before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: [:home, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:home, :index], unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo, :personal_description, :expertise, :availability, :address])
  end
