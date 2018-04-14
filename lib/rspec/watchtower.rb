require 'rspec/core'
require 'net/http'
require 'uri'
require 'json'

require "watchtower/version"
require 'watchtower/api'
require 'watchtower/config'
require 'watchtower/test_run'
require 'watchtower/test_result'

RSpec::configure do |config|
  config.include(RSpec::Watchtower)

  config.before(:all) do
    Watchtower::TestRun.initialize_test_run
  end

  config.after(:all) do |example|
    Watchtower::TestRun.current.submit
  end

  config.after do |example|
    Watchtower::TestRun.current.add_test_result(example)
  end
end
