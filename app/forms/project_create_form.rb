class ProjectCreateForm
    include ActiveModel::Model

    attr_accessor :name, :user

    validates :name, :user, presence: true
    validate :user_has_same_project_name

    def save
        return false unless valid?
        ActiveRecord::Base.transaction do
            create_project
            create_membership
        end
        true
    rescue ActiveRecord::RecordInvalid => e
        errors.add(:base, "somethhing went wrong")
    end

    private

    def create_project
        @project ||= Project.create!(name: name)
    end

    def create_membership
        @project.memberships.create!(user_id: user.id, role: 20)
    end

    def user_has_same_project_name
        return true unless user&.projects&.find_by(name: name)
        errors.add(:base, "Your projects need to have unique names") and return false
    end
end