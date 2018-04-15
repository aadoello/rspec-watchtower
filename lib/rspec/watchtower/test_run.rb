module RSpec
  module Watchtower
    class TestRun
      def submit
        uri = URI.parse("#{Config.api_url}/pipelines/#{Config.pipeline}/results")
        headers = {
          'Content-Type': 'text/json',
          'Authorization': Config.api_token
        }

        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = self.class.current.to_json

        http.request(request)
      end

      def add_test_result(result)
        @results ||= []
        @results << TestResult.new(result)
      end

      class << self
        attr_accessor :current

        def initialize_test_run
          self.current = self.new
        end
      end
    end
  end
end
