require 'forwardable'

class TaskPresenter
    extend Forwardable

    def_delegator :@task, :title # delegate doesn't like two methods? Why, so weird
    def_delegator :@task, :description

    def initialize(task)
        @task = task
    end

    def formatted_title
        @task.title.upcase
    end
end 