class TaskCreateForm
    include ActiveModel::Model
    
    attr_accessor :title, :project, :due_date

    validates :title, :project, :due_date, presence: true
    validate :title_is_unique?

    def save
        return false unless valid?
        create_task
        true
    rescue => e
        errors.add(:base, "something went wrong")
        false
    end

    private

    def create_task
        project.tasks.create!(title: title, due_date: due_date)
    end

    def title_is_unique?
        return true unless project.tasks.find_by(title: title)
        errors.add(:base,'task title has to be unique') and return false
    end
end
