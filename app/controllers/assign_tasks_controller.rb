class AssignTasksController < ApplicationController
  before_action :set_assign_task, only: [:show, :edit, :update, :destroy]

  # GET /assign_tasks
  # GET /assign_tasks.json
  def index
    @assign_tasks = AssignTask.all
  end

  # GET /assign_tasks/1
  # GET /assign_tasks/1.json
  def show
  end

  # GET /assign_tasks/new
  def new
    @user = User.find(params[:user_id])
    $user_g = @user
    @assign_task = AssignTask.new
  end

  # GET /assign_tasks/1/edit
  def edit
  end

  # POST /assign_tasks
  # POST /assign_tasks.json
  def create

    @assign_task = AssignTask.new(assign_task_params)
    @assign_task.user = $user_g

    respond_to do |format|
      if @assign_task.save
        format.html { redirect_to @assign_task, notice: 'Assign task was successfully created.' }
        format.json { render :show, status: :created, location: @assign_task }
      else
        format.html { render :new }
        format.json { render json: @assign_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assign_tasks/1
  # PATCH/PUT /assign_tasks/1.json
  def update
    respond_to do |format|
      if @assign_task.update(assign_task_params)
        format.html { redirect_to @assign_task, notice: 'Assign task was successfully updated.' }
        format.json { render :show, status: :ok, location: @assign_task }
      else
        format.html { render :edit }
        format.json { render json: @assign_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assign_tasks/1
  # DELETE /assign_tasks/1.json
  def destroy
    @assign_task.destroy
    respond_to do |format|
      format.html { redirect_to assign_tasks_url, notice: 'Assign task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_assign_task
    @assign_task = AssignTask.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def assign_task_params
    params.require(:assign_task).permit(:title, :description, :deadline, :user_id)
  end
end
