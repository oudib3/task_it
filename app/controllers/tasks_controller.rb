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

    def show
        project
        task

        respond_to do |f|
            f.js
            f.html
        end
    end

    private

    def task_params
        params.permit(:title, :due_date).merge(project: project)
    end

    def project
        @project ||= Project.find(params[:project_id])
    end

    def task
        @task = Task.find(params[:id])
    end
end