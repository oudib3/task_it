class ProjectsController < ApplicationController
    def new
        @form = ProjectCreateForm.new
        authorize @form
    end

    def create
        @form = ProjectCreateForm.new(project_params.merge(user: current_user))
        authorize @form
        if @form.save
            redirect_to current_user
        else
            render :new
        end
    end

    def show
        project
        @tasks = TaskDecorator.decorate_collection(project.tasks.reverse)
        # authorize project
        raise Pundit:NotAuthorizedError unless ProjectPolicy.new(current_user, membership, project).show?
    end

    private

    def project_params
        params.permit(:name)
    end

    def project
        @project ||= Project.find(params[:id])
    end

    def membership
        @membership = Membership.find_by(user_id: current_user.id, project_id: project.id)
    end
end
