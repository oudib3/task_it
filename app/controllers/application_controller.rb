class ApplicationController < ActionController::Base
    def current_user
        current_user ||= User.find(session[:current_user_id]) || nil
    rescue ActiveRecord::RecordNotFound
        session[:current_user_id] = nil  #case when user still got session id of not existing user
        nil
    end

    helper_method :current_user
end