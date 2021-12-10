class Coach < ApplicationRecord
  has_one :course

  validates :name, presence: true
end
