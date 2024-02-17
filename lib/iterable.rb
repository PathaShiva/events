require 'json'
require 'net/http'
require 'uri'

files = %w[
  api_resource
  config
  events
  email
]

files.each { |path| require_relative "./iterable/#{path}" }

module Iterable
  class << self
    def configure(&block)
      config.tap(&block)
    end

    def config
      @config ||= Config.new
    end
    
    def request(conf, path, params = {})
      Request.new(conf, path, params)
    end
  end
end
