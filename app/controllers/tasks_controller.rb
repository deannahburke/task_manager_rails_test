class TasksController < ApplicationController
  def index
    @tasks = Task.all # lazy loading the tasks
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
    end
  end

  def new
  end

  def create
    task = Task.new({
      title: params[:title],
      description: params[:description]
    })

    task.save
    @task = TaskPresenter.new(task)

    redirect_to "/tasks"
  end

  def show
    task = Task.find(params[:id])
    @id = task.id
    @task = TaskPresenter.new(task)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end 
  end

  def edit
    @task = Task.find(params[:id])
  end 

  def update
    task = Task.find(params[:id])
  task.update({
    title: params[:title],
    description: params[:description]
    })
  task.save
  redirect_to "/tasks/#{task.id}"
  end 

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end 

end
