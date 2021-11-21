class Project < ApplicationRecord
    has_many :todos

    validates :title, presence: true,  length: { maximum: 20 }
end
