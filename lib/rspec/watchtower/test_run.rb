module RSpec
  module Watchtower
    class TestRun
      def initialize(notification)
        @load_time = notification.load_time
        @duration = notification.duration
        @results = notification.examples.map do |e|
          TestResult.new(e)
        end
      end

      def submit
        uri = URI.parse("#{Config.api_url}/pipelines/#{Config.pipeline}/results")
        headers = {
          'Content-Type': 'text/json',
          'Authorization': Config.api_token
        }

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = self.to_json

        http.request(request)
      end
    end
  end
end
