class UserController < ApplicationController

    #post /sign_up
    def sign_up
        if (User.find_by_email(auth_params[:email]))
            render json: "email exists", status: :unprocessable_entity
        else
            user = User.new
            user.name = auth_params[:name]
            user.email = auth_params[:email]
            user.password = auth_params[:password]
            if (user.save)
                render json: "go log in at /user_token", status: :success
            else
                render json: user.errors, status: :unprocessable_entity
            end
        end
    end

    private:

    def auth_params
        params.require(:auth).permit :name, :email, :password
    end
    
end