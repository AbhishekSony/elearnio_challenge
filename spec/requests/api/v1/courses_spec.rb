require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :request do
  describe 'GET /index' do
    before do
      create_list(:course, 3, :self_assignable_true)
      create_list(:course, 3, :self_assignable_false)
      get '/api/v1/courses'
    end

    it_behaves_like 'success response'
    it 'return response' do
      expect(json).to have_key('data')
      expect(json['data']).to be_a(Array)
      expect(json['data'].size).to eq(6)
    end

    context 'filters' do
      it 'by self_assignable' do
        get '/api/v1/courses', params: { filter: { self_assignable: false } }

        expect(json['data'].size).to eq(3)
        expect(collect_uniq_attributes('self-assignable')).to eq([false])
      end
    end
  end

  describe 'GET /show' do
    subject { create(:course) }

    before do
      get api_v1_course_path(subject)
    end

    it_behaves_like 'success response'
    it 'returns response' do
      expect(json).to have_key('data')
      expect(json['data']).to be_a(Hash)
      expect(json['data']).to include(*%w[id type links attributes relationships])
    end
  end
end
