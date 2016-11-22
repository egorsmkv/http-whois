require 'sinatra/base'

module Http
  module Whois
    class Base < Sinatra::Base
      configure do
        disable :method_override
        disable :static
      end

      before do
        content_type 'application/json; charset=utf-8'
      end

      not_found do
        JSON.pretty_generate(error: 'Resource not found.')
      end
    end
  end
end
