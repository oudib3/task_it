class ApplicationController < ActionController::Base
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized\

    def current_user
        current_user ||= User.find(session[:current_user_id]) || nil
    rescue ActiveRecord::RecordNotFound
        session[:current_user_id] = nil  #case when user still got session id of not existing user
        nil
    end

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action"
        redirect_to(request.referer || root_path)
    end
    helper_method :current_user
end