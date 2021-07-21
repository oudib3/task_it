class ProjectCreateFormPolicy < ApplicationPolicy
    attr_reader :user, :form
    
    def initialize(user, form)
        @user = user
        @form = form
    end

    def new
        user_exists?
    end

    def create
        user_exists?
    end

    private 

    def user_exists?
        return false unless User.find(@user&.id)
        true
    end
end