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

  redirect_to '/tasks'
    end

end