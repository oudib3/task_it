class ProjectPolicy < ApplicationPolicy
    attr_reader :user, :project

    def initialize(user,membership, project)
        @user = user
        @membership = membership
        @project = project
    end

    def new?
        @user.present? 
    end

    def create?
        @user.present?
    end

    def show?
        @user.present? && @membership.user_id == @user.id && @membership.project_id == @project.id
    end
end