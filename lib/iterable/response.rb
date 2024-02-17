module Iterable
  class Response
    attr_reader :body

    def initialize(resp)
      @resp = resp
      @body = parsed_body
    end

    def success?
      case @resp.code.to_i
      when (200..299) then true
      else
        false
      end
    end

    def parsed_body
      response_body = @resp.body
      JSON.parse(response_body)
    rescue
      response_body
    end
  end
end
