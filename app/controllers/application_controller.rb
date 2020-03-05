class ApplicationController < ActionController::Base
before_action :authenticate_user!

  include Pundit # Necessary for Pundit to be active
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

# After_action are executed after the method being executed.
# It checks that any action calls the verification
# If not, it triggers a warning

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
     flash[:alert] = "You are not authorized to perform this action."
     redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
