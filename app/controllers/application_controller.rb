class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :except => [:home]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def current_or_guest_user
    current_user || guest_user
  end
 
  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
 
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end

  def create_guest_user
    u = User.create(email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    u
  end
end
