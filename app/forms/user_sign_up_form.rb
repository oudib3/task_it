class UserSignUpForm
    include ActiveModel::Model

    attr_accessor :email, :nickname, :password, :password_confirmation
    attr_reader :user

    validates :email, :nickname, :password, :password_confirmation, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, confirmation: true

    def save
        return false unless valid?
        create_user
        true
    rescue => email
        errors.add(:base, 'something went wrong')
        false
    end

    def user
        user = @user
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
end