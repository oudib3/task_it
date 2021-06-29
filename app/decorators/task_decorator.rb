class TaskDecorator < BaseDecorator
    def time_remaining
        if days_remaining < 1
            return "ASAP"
        end
        "#{due_date.to_formatted_s(:short)} (#{@days_remaining} day/s)"
    end

    def days_remaining
        @days_remaining ||= ((due_date - Time.now)/86400).round
    end
end