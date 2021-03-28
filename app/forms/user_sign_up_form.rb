class UserSignUpForm
    include ActiveModel::Model

    attr_accessor :email, :nickname, :password, :password_confirmation
    attr_reader :user

    validates :email, :nickname, :password, :password_confirmation, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, confirmation: true
    validate :email_is_unique?
    validate :nickname_is_unique?

    def save
        return false unless valid?
        create_user
        true
    rescue => email
        errors.add(:base, 'something went wrong')
        false
    end

    private

    def create_user
        @user ||= User.create!(
            email: email.downcase,
            nickname: nickname,
            password: password, 
            password_confirmation: password_confirmation,
        )
    end

    def email_is_unique?
        if User.find_by(email: email)
            errors.add(:base, "Email address already taken") and return false
        end
        true
    end

    def nickname_is_unique?
        if User.find_by(nickname: nickname)
            errors.add(:base, "Nickname already taken") and return false
        end
        true
    end
end