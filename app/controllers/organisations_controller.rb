class OrganisationsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @organisation = Organisation.new
    end
    
    def create
        @user = User.find(params[:user_id])
        @organisation = @user.organisations.create(organisation_params)
        
        if @organisation.save
            redirect_to user_path(@user)
        else
            render 'new'
        end 
    end
    def show
        @organisation = Organisation.find(params[:id])
        @user = @organisation.user
        @management = Management.new
    end

    private

    def organisation_params
        params.require(:organisation).permit(:name, :address)
    end
end
