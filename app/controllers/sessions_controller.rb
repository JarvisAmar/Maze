class SessionsController < ApplicationController
    # POST /login
    def create

    # search user with provided email
      user = User.find_by(email: params[:email])
    # params[:email] pulls data from the request payload (e.g., JSON from a login form).
      
      if user&.authenticate(params[:password])   # Authenticate with bcrypt
        # The authenticate method is provided by has_secure_password in the User model, which uses bcrypt to hash passwords.
        # The safe navigation operator &. prevents errors if user is nil (e.g., if no user was found).
        session[:user_id] = user.id              # Store user ID in session
        # Stores the user_id in the session hash (managed via cookies).
        # This lets the app track if a user is logged in on subsequent requests.
        render json: { id: user.id, name: user.name, email: user.email }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    # DELETE /logout
    def destroy
      session[:user_id] = nil  # Clear session
      render json: { message: "Logged out successfully" }, status: :ok
    end
  end
  