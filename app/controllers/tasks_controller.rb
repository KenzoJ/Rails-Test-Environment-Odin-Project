class TasksController < ApplicationController
  def index
    @page = params[:page].to_i
    @tasks = ['fold laundry', 'sweep porch', 'wash dishes']
  end

  def new
  end

  def edit
  end
end
