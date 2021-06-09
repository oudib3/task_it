class User < ActiveRecord::Base
    has_secure_password

    has_many :memberships, dependent: :destroy
    has_many :projects, through: :memberships
end