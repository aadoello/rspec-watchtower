module RSpec
  module Watchtower
    class TestResult
      attr_accessor :title, :location, :result, :run_time

      def initialize(example)
        @title = example.description
        @full_title = example.full_description
        @location = example.location
        puts example.execution_result
        @status = example.execution_result.status
        @run_time = example.execution_result.run_time
      end
    end
  end
end
