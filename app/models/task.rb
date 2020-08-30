class Task < ApplicationRecord
  validates :task, presence: true
end
