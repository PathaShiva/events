module Iterable
  class Config

    DEFAULT_VERSION = '1.8'.freeze
    DEFAULT_HOST = 'https://api.iterable.com'.freeze
    DEFAULT_URI = "#{DEFAULT_HOST}/api".freeze
    DEFAULT_PORT = 443

    attr_accessor :token
    attr_reader :host, :port, :version

    def initialize(token: nil)
      @host = DEFAULT_HOST
      @port = DEFAULT_PORT
      @version = DEFAULT_VERSION
      @token = token
    end

    def uri
      URI.parse("#{@host || DEFAULT_HOST}:#{@port || DEFAULT_PORT}/api")
    end
  end
end
