require "forwardable"

class TaskPresenter
  extend Forwardable

  def_delegator :@task, :title # delegate doesn't like two methods? Why, so weird
  def_delegator :@task, :description
  def_delegator :@task, :id

  def initialize(task)
    @task = task
  end

  def formatted_title
    @task.title.upcase
  end

  def as_json
    {
      id: @task.id,
      title: formatted_title,
      description: @task.description
    }
  end
end
