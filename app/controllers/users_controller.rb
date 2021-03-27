class UsersController < ApplicationController
    def new
    end

    def create
        @form = UserSignUpForm.new(user_params)
    end

    private

    def user_params
        params.permit(:email, :nickname, :password, :password_confirmation)
    end
end
