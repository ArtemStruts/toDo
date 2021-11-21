class Todo < ApplicationRecord
  belongs_to :project

  validates :text, presence: true, length: { maximum: 40 }
end
