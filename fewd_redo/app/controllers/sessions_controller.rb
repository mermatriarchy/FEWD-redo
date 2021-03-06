class SessionsController < ApplicationController
	def create
    user = User.find_by_id(params[:user_id])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/class-attendance'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_back fallback_location: '/enter'
    end
  end

  #logout
    def destroy
      session[:user_id] = nil
      redirect_back(fallback_location: root_path)
    end

end
