class BaseDecorator < SimpleDelegator
    def decorate
        ApplicationController.helpers.decorate(model, decorate_class)
    end
end