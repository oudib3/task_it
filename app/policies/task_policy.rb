class TaskPolicy < ApplicationPolicy
    attr_reader :current_user, :member, :task

    def initialize(current_user, member, task)
        @current_user = current_user
        @member = member
        @task = task
    end

    def new?
        user_exists? && (@member.admin? || @member.master?)
    end

    def create?
        user_exists? && (@member.admin? || @member.master?)
    end

    def show?
        user_exists? && @member.present?
    end

    private

    def user_exists?
        return false unless User.find(@current_user.id)
        true
    end
end