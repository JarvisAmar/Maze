# class ApplicationController < ActionController::Base
#   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   allow_browser versions: :modern
# end


class ApplicationController < ActionController::Base
  # Disable CSRF protection in API mode
  protect_from_forgery with: :null_session
end

