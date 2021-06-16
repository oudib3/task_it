FactoryBot.define do
    factory :task do
        sequence(:title) { |n| "task#{n}" }
    end
end