class ActivitiesController < ApplicationController
    before_action :set_management
    before_action :set_organization
    def new
        
        @activity = @management.activities.build
    end
    def index
        @activities = @management.activities.all
    end
    def create 
        
        @activity = @management.activities.create(activity_params)
        
        if @activity.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    def show
        @activity = Activity.find(params[:id])
        @organisation = @management.organisation
        
        @management = @activity.management
        
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :status)
    end
    
    def set_organization
        @organisation  = User.find(params[:user_id]).organisations.find(params[:organisation_id])
    end

    def set_management
        @management  = Organisation.find(params[:organisation_id]).managements.find(params[:management_id])
    end
end
