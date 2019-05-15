class ProfileController < ApplicationController


    def index
      @user = current_user

      @tasks = @user.assign_tasks
    end

end
