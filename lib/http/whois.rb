require 'http/whois/version'
require 'http/whois/base'

require 'json'

require 'simpleidn'
require 'whois-parser'

# Alias for whois library
WhoisLib = Whois

module Http
  module Whois
    class Routes < Base
      get '/whois/:domain' do
        # Encode to Punycode format
        domain = SimpleIDN.to_ascii(params['domain'])

        begin
          # Send whois request and return parser
          parser = WhoisLib.whois(domain).parser

          # Syntax sugar
          def is?(parser, symbol)
            parser.property_any_supported?(symbol)
          end

          response = {
            available: (parser.available? if is?(parser, :available?)),
            domain: (parser.domain if is?(parser, :domain)),
            domain_id: (parser.domain_id if is?(parser, :domain_id)),
            nameservers: (parser.nameservers if is?(parser, :nameservers)),
            created_on: (parser.created_on if is?(parser, :created_on)),
            updated_on: (parser.updated_on if is?(parser, :updated_on)),
            expires_on: (parser.expires_on if is?(parser, :expires_on)),
            registrar: (parser.registrar.to_h if is?(parser, :registrar)),
            registrant_contacts: (parser.registrant_contacts.map!(&:to_h) if is?(parser, :registrant_contacts)),
            admin_contacts: (parser.admin_contacts.map!(&:to_h) if is?(parser, :admin_contacts)),
            technical_contacts: (parser.technical_contacts.map!(&:to_h) if is?(parser, :technical_contacts)),
            disclaimer: (parser.disclaimer if is?(parser, :disclaimer))
          }

          JSON.pretty_generate(response)
        rescue StandardError => e
          JSON.pretty_generate(error: e.message)
        end
      end
    end
  end
end
