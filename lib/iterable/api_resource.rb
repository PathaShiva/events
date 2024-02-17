module Iterable
  class ApiResource
    attr_reader :conf

    def initialize(conf = nil)
      @conf = conf || default_config
    end

    def self.default_config
      Iterable.config
    end

    def default_config
      self.class.default_config
    end
  end
end
