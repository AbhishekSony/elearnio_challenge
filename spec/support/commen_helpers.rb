module Response
  module CommenHelper
    def collect_attributes(name)
      json['data'].map { |record| record['attributes'][name] }
    rescue StandardError
      []
    end

    def collect_uniq_attributes(name)
      collect_attributes(name).uniq
    end
  end
end
