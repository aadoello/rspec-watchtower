require 'rspec/core'
require 'net/http'
require 'uri'
require 'json'
require 'rest-client'

require 'rspec/watchtower/version'
require 'rspec/watchtower/config'
require 'rspec/watchtower/test_run'
require 'rspec/watchtower/test_result'

class WatchtowerFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def initialize(output)
    @output = output
  end

  def dump_summary(notification)
    tr = RSpec::Watchtower::TestRun.new(notification)
    tr.submit
  end
end

RSpec::configure do |config|
  watchtower_configured = ENV['WATCHTOWER_API_TOKEN'] && ENV['WATCHTOWER_PIPELINE']
  config.formatter = WatchtowerFormatter if watchtower_configured
end
