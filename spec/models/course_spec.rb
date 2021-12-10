require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    subject { create(:course) }

    it { is_expected.to validate_presence_of(:name) }

    it 'one coach can be assigned only for one course' do
      expect do
        create(:course, coach: subject.coach)
      end.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Coach has already been taken')
    end

    context 'on update coach' do
      it 'when coach is not nil' do
        subject.update(coach: create(:coach))
        expect(subject).not_to be_valid
        expect(subject.errors.full_messages).to include('Coach Coach can not be change if alreay assignd')
      end

      it 'when coach is nil' do
        subject.update(coach: nil)
        subject.update(coach: create(:coach))

        expect(subject).to be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:coach).optional }
    it { is_expected.to have_many(:activities).dependent(:destroy) }
  end
end
