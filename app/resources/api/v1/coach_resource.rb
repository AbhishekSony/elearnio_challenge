module Api
  module V1
    class CoachResource < JSONAPI::Resource
      attributes :name

      has_one :coach
    end
  end
end
