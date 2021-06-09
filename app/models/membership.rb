class Membership < ActiveRecord::Base
    belongs_to :user
    belongs_to :project

    enum role: {
        member: 0,
        admin: 10,
        master: 20
    }
end