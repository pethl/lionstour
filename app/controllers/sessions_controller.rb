class SessionsController < ApplicationController
  def new
    end

    def create
      user = User.find_by_name(params[:session][:name])
      # case sensitivity removed because wasnt correctly implemented first time, should have .downcase before last bracket up above!
         if user && user.authenticate(params[:session][:password])
           sign_in user
                redirect_to user
         else
           flash.now[:error] = 'Invalid name/password combination'
                 render 'new'
         end
    end

    def destroy
        sign_out
        redirect_to root_url
      end
end
