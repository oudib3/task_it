class DescriptionCreateForm
    include ActiveModel::Model

    attr_accessor :descriptable_id, :descriptable_type, :content

    validates :descriptable_id, :descriptable_type, :content, presence: true
    validate :descriptable_type_exists
    validate :descriptable_id_exists

    def save
        return false unless valid?
        create_description
        true
    rescue
        errors.add(:base, 'something went wrong')
        false
    end

    private

    def create_description
        Description.create!(content: content, descriptable_id: descriptable_id, descriptable_type: descriptable_type)
    end

    def descriptable_type_exists
        return true if descriptable_type.capitalize.constantize && descriptable_types.include?(descriptable_type.capitalize)
        errors.add(:base, 'descriptable type unknown')
        false
    end

    def descriptable_id_exists
        descriptable_type.constantize.find(descriptable_id)
    end

    def descriptable_types
        %w[Task]
    end
end