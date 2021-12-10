require 'rails_helper'

RSpec.describe Coach, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:course) }
  end
end
