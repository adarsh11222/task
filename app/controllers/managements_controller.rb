class ManagementsController < ApplicationController
    before_action :set_organization
    def new
        
        @management = @organisation.managements.build
    end
    def index
        @managements = @organisation.managements.all
    end
    def create
       
        @management = @organisation.managements.create(management_params)
        
        if @management.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def show
        @management = Management.find(params[:id])
        @organisation = @management.organisation
    end

    private

    def management_params
        params.require(:management).permit(:name, :work)
    end

    def set_organization
        @organisation  = User.find(params[:user_id]).organisations.find(params[:organisation_id])
    end
end
