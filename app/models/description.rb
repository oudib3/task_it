class Description < ActiveRecord::Base
    belongs_to :descriptable, polymorphic: true
end