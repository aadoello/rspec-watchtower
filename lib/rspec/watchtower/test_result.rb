module RSpec
  module Watchtower
    class TestResult
      attr_accessor :title, :full_title, :location, :status, :run_time, :details

      def initialize(example)
        @title = example.description
        @full_title = example.full_description
        @location = example.location
        @status = example.execution_result.status.upcase
        @run_time = example.execution_result.run_time
        @details = example.execution_result.exception
      end

      def to_h
        {
          title: self.title,
          full_title: self.full_title,
          location: self.location,
          status: self.status,
          run_time: self.run_time,
          details: self.details
        }
      end
    end
  end
end
