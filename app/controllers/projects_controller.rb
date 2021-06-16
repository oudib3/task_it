class ProjectsController < ApplicationController
    def new
    end

    def create
        @form = ProjectCreateForm.new(project_params.merge(user: current_user))
        if @form.save
            redirect_to current_user
        else
            render :new
        end
    end

    def show
        project
        @tasks = project.tasks.reverse
    end

    private

    def project_params
        params.permit(:name)
    end

    def project
        @project ||= Project.find(params[:id])
    end

end
