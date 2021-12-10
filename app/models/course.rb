class Course < ApplicationRecord
  belongs_to :coach, optional: true
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :coach, uniqueness: true
  validate :change_coach_not_allow, on: :update, if: :coach_id_changed?

  private

  # coach can be changed if course does't have any coach.
  def change_coach_not_allow
    return if coach_id_was.nil? || coach_id.nil?

    errors.add(:coach_id, 'Coach can not be change if alreay assignd')
  end

  
end
