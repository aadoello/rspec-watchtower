module RSpec
  module Watchtower
    class TestRun
      attr_accessor :load_time, :duration, :results

      def initialize(notification)
        @load_time = notification.load_time
        @duration = notification.duration
        @results = notification.examples.map do |e|
          TestResult.new(e)
        end
      end

      def to_h
        {
          load_time: self.load_time,
          duration: self.duration,
          results: self.results.map(&:to_h)
        }
      end

      def submit
        url = "#{Config.api_url}/pipelines/#{Config.pipeline}/results"
        headers = {
          'Content-Type': 'text/json',
          'Authorization': Config.api_token
        }
        payload = self.to_h.to_json
        RestClient.post(url, payload, headers)
      end
    end
  end
end
