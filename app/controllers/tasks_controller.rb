class TasksController < ApplicationController
  def index
    @page = params[:page].to_i
    @tasks = Task.order(:position)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render('new')
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render('edit')
    end
  end


  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(:name, :position, :description)
  end

end
