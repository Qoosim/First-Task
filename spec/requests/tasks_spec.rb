require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
   it 'displays some tasks' do
    @task = Task.create(task: 'go to bed')
    visit tasks_path
    expect(page).to have_content('go to bed')
    end

    it 'creates a new task' do
      visit tasks_path
      fill_in 'Task', with: 'go to work'
      click_on 'Create Task'
      expect(page).to have_content('go to work')
    end
  end
end
