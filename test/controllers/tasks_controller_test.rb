require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    task = Task.create!(title: "Gardening", description: "Pull all weeds")

    get "/tasks.json"
    assert_response :success
    binding.pry
    parsed_body = (JSON.parse(body)).size 
    assert_equal 1, parsed_body
    #binding.pry
  end

  # test "renders HTML" do
  # task = Task.create!(title: "Gardening", description: "Pull all weeds")
  # binding.pry
  # assert_pattern { rendered.html => { title: "Gardening", description: "Pull all weeds"  } }
  # end

  # test "renders JSON" do
  # task = Task.create!(title: "Gardening", description: "Pull all weeds")
  # binding.pry
  # render formats: :json, partial: "task", locals: { task: task }
  # assert_pattern { rendered.json => { title: "Gardening", description: "Pull all weeds"  } }
  # end
end
