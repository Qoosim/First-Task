class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to(:root, notice: 'Task created!')
    else
      redirect_to :root
    end
  end

  def edit
    @task = fetch_task
  end

  def update
    @task = fetch_task
    if @task.update(task_params)
      redirect_to(:root, notice: 'Task updated!')
    else
      flash.now[:notice] = 'Task is empty!'
      render :edit
    end
  end

  def destroy
    @task = fetch_task
    @task.destroy

    redirect_to(:root, notice: 'Task has been deleted')
  end

  def show
    @task = fetch_task
  end

  private
    def task_params
      params.require(:task).permit(:task)
    end

    def fetch_task
      Task.find(params[:id])
    end
end
