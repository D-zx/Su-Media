class TaskController < ApplicationController
  def index
    @users = User.all

    if params[:show] != nil then
      @show = params[:show]
      redirect_to task_show_path(:id => @show)
    end
  end
  def show

    @user = User.find(params[:id])
      @tasks = AssignTask.where(user_id: params[:id])



  end
end
