# Whois HTTP API

**http-whois** - is a simple http api for viewing whois records in
http protocol based on popular whois client for Ruby - https://github.com/weppos/whois.

## Installation

### From RubyGems

```shell
gem install http-whois
```

### From sources

```shell
git clone https://github.com/egorsmkv/http-whois
cd http-whois
bundle install
```

## Run

### Using unicorn and systemd

Empty.

### Development server

```shell
bundle exec rackup
# ... and go to http://127.0.0.1:9292/
```

## TODO

- [ ] Add tests and Travis-CI integrate
- [ ] Add [Throttle](https://github.com/dryruby/rack-throttle)
- [ ] Add Dockerfile and image to Docker Hub
