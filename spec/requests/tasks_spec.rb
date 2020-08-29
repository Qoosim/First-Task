require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
   it 'displays some tasks' do
    @task = Task.create(task: 'go to bed')
    visit tasks_path
    expect(page).to have_content('go to bed')
  end
  end
end
