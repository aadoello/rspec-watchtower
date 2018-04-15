module RSpec
  module Watchtower
    class TestResult
      attr_accessor :title, :location, :result, :run_time

      def initialize(example)
        @title = example.description
        @full_title = example.full_description
        @location = example.location
        puts example.execution_result.to_h
        puts example.execution_result.attributes
        puts example.execution_result.to_a
        puts example.execution_result.inspect
        @status = example.execution_result.status
        @run_time = example.execution_result.run_time
      end
    end
  end
end
