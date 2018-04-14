module RSpec
  module Watchtower
    class Config
      API_URL = 'https://wtapi.herokuapp.com'

      class << self
        def api_url
          API_URL
        end

        def api_token
          ENV['WATCHTOWER_API_TOKEN']
        end

        def pipeline
          ENV['WATCHTOWER_PIPELINE']
        end
      end
    end
  end
end
