class SessionsController < ApplicationController
    def new
    end

    def create
        @form = UserSignInForm.new(session_params)
        if @form.valid?
            session[:current_user_id] = @form.user.id
            redirect_to user_path(@form.user.id)
        else
            render :new
        end        
    end

    def destroy
        session.delete(:current_user_id)
        redirect_to root_path
    end
    
    private

    def session_params
        params.permit(:email, :password)
    end
end