require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  before do
    @task = Task.create(task: 'go to bed')
  end
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

  describe "PUT /tasks" do
    it 'edits a task' do
      visit tasks_path
      click_on 'Edit'
      find_field('Task').value == 'go to bed'
      fill_in 'Task', with: 'updated task'
      click_on 'Update Task'
      expect(page).to have_content('updated task')
    end

    it 'should not update an empty task' do
      visit tasks_path
      click_on 'Edit'

      fill_in 'Task', with: ''
      click_on 'Update Task'
      expect(page).to have_content('Task is empty!')
    end
  end

  describe 'DELETE /tasks' do
    it 'should delete a task' do
      visit tasks_path
      find("#task_#{@task.id}")
      click_on 'Delete'
      expect(page).to have_content('Task has been deleted')
      expect(page).to have_no_content('go to bed')
    end
  end
  
end
