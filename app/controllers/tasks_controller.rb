class TasksController < ApplicationController

    def new
        @task = Task.new
        raise Pundit::NotAuthorizedError unless TaskPolicy.new(current_user, member, @task).new?
    end

    def create
        @form = TaskCreateForm.new(task_params)
        raise Pundit::NotAuthorizedError unless TaskPolicy.new(current_user, member, @form).create?
        if @form.save
            redirect_to project_path(project)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
        
    end

    def show
        project
        task_decorator
        raise Pundit::NotAuthorizedError unless TaskPolicy.new(current_user, member, task).show?
        respond_to do |f|
            f.html
            f.json { render json: task }
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
        @task ||= Task.find(params[:id])
    end
    
    def task_decorator
        @task_decorator = task.decorate
    end

    def member
        @member ||= Membership.find_by(user_id: current_user, project_id: project)
    end
end
