require 'rspec/core'
require 'net/http'
require 'uri'
require 'json'

require 'rspec/watchtower/version'
require 'rspec/watchtower/api'
require 'rspec/watchtower/config'
require 'rspec/watchtower/test_run'
require 'rspec/watchtower/test_result'

RSpec::configure do |config|
  puts __FILE__
  config.include(RSpec::Watchtower)

  config.before(:all) do
    puts 'before all'
    Watchtower::TestRun.initialize_test_run
  end

  config.after(:all) do |example|
    puts 'after all'
    Watchtower::TestRun.current.submit
  end

  config.after do |example|
    puts 'after'
    Watchtower::TestRun.current.add_test_result(example)
  end
end
