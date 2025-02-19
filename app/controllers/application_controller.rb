# class ApplicationController < ActionController::Base
#   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   allow_browser versions: :modern
# end


class ApplicationController < ActionController::Base
  # Disable CSRF protection in API mode
  # protect_from_forgery with: :null_session

  helper_method :current_user

  def current_user
    # Example: Fetch user from session if user is logged in
    @current_user ||= User.find_by(id: session[:user_id]) #Retrieves the logged-in user only if they exist in the session.
  end
end

