class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :due_date

  belongs_to :project
end
