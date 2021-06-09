class UsersController < ApplicationController
    def new
    end

    def create
        @form = UserSignUpForm.new(user_params)
        if @form.save
            redirect_to new_session_path
        else
            render :new
        end
    end

    def show
        @projects = current_user.projects
    end

    private

    def user_params
        params.permit(:email, :nickname, :password, :password_confirmation)
    end
end
