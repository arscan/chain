class ChecksController < ApplicationController

    def create
        
        datetime = Time.now
        @activity = Activity.find(params[:activity_id])
        @check = @activity.checks.create(datetime: datetime)

        redirect_to "/activities"

    end
end
