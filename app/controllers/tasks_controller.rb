class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @taskShow = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params[:title], details: params[:details])
    if @task.save
      redirect_to tasks_path, notice: "Tarea '#{params[:title]}' creada !"
    else
      render :new, status: :unprocessable_entity
    end
  end

end
