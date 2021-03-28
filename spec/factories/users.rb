FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "person#{n}@email.com" }
        nickname {'nickname'}
        password {'password'}
        password_confirmation {'password'}
    end
end