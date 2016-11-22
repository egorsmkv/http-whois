# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'http/whois/version'

Gem::Specification.new do |spec|
  spec.version       = Http::Whois::VERSION
  spec.authors       = ['Egor Smolyakov']
  spec.email         = ['egorsmkv@gmail.com']

  spec.name          = 'http-whois'
  spec.summary       = 'Self-hosted whois HTTP API.'
  spec.homepage      = 'https://github.com/egorsmkv/http-whois'
  spec.license       = 'BSD-3-Clause'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
