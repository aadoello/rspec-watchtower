require 'rspec/core'
require 'net/http'
require 'uri'
require 'json'

require 'rspec/watchtower/version'
require 'rspec/watchtower/config'
require 'rspec/watchtower/test_run'
require 'rspec/watchtower/test_result'

class CustomFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def initialize(output)
    @output = output
  end

  def dump_summary(notification)
    binding.pry
  end
end

RSpec::configure do |config|
  config.include(RSpec::Watchtower)
  config.formatter = CustomFormatter

  config.before(:all) do
    RSpec::Watchtower::TestRun.initialize_test_run
  end

  config.after(:all) do |example|
    RSpec::Watchtower::TestRun.current.submit
  end

  config.after do |example|
    RSpec::Watchtower::TestRun.current.add_test_result(example)
  end
end
