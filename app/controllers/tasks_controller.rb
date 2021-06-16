class TasksController < ApplicationController
    def new
    end

    def create
        @form = TaskCreateForm.new(task_params)
        if @form.save
            redirect_to project_path(project)
        else
            render :new
        end
    end

    private

    def task_params
        params.permit(:title).merge(project: project)
    end

    def project
        @project ||= Project.find(params[:project_id])
    end
end