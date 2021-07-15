class DescriptionsController < ApplicationController

    def new
        descriptable_params
    end

    def create
        @form = DescriptionCreateForm.new(descriptable_params.merge(content: content))
        if @form.save
            redirect_to project_task_path(project, task)
        else
            render :new
        end
    end

    private

    def descriptable_params
        @descriptable_params ||= {descriptable_id: descriptable_id, descriptable_type: descriptable_type}
    end

    def descriptable_id
        params[:descriptable_id].to_i
    end

    def descriptable_type
        params[:descriptable_type]
    end

    
    def content
        params[:content]
    end
    
    def task
        @task ||= Task.find(params[:descriptable_id])
    end
    
    def project
        @project = task.project
    end
end
