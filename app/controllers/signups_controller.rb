class SignupsController < ApplicationController
    def new
        @signup = Signup.new

        @activities = Activity.all
        @campers = Camper.all
    end

    def create
        signup = Signup.create(signup_params)

        if signup.valid?
            redirect_to camper_path(signup.camper.id)
        else
            flash[:errors] = signup.errors.full_messages
            redirect_to new_signup_path
        end
    end

    private
    def signup_params
        params.require(:signup).permit(:activity_id,:camper_id, :hour_of_activity)
    end
end
