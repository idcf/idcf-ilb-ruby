# Idcf::Ilb
[![Gem Version](https://badge.fury.io/rb/idcf-ilb.svg)](http://badge.fury.io/rb/idcf-ilb)
[![Build Status](https://travis-ci.org/idcf/idcf-ilb-ruby.svg?branch=master)](https://travis-ci.org/idcf/idcf-ilb-ruby)
[![Code Climate](https://codeclimate.com/github/idcf/idcf-ilb-ruby/badges/gpa.svg)](https://codeclimate.com/github/idcf/idcf-ilb-ruby)
[![Test Coverage](https://codeclimate.com/github/idcf/idcf-ilb-ruby/badges/coverage.svg)](https://codeclimate.com/github/idcf/idcf-ilb-ruby/coverage)

A Ruby client for [IDCF Cloud ILB service](https://console.jp-east.idcfcloud.com/ilb/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idcf-ilb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idcf-ilb

## Usage
### Basic usage
#### Client
You can create a instance of client by specifying API_KEY and SECRET_KEY.  
You can get API_KEY and SECRET_KEY in [IDCF Cloud](https://console.idcfcloud.com/user/apikey).

```ruby
require "idcf/ilb"

client =
  Idcf::Ilb::Client.new(
    api_key: ENV["IDCF_API_KEY"],
    secret_key: ENV["IDCF_SECRET_KEY"]
  )

# Call GET request directly
# returns Response object
response = client.get("loadbalancers")
response.success? #=> true
response.status   #=> 200

# Response#body returns HTTP response body as a hash or an array
response.body     #=> [loadbalancer1, loadbalancer2, ...]
response.body[0]  #=> loadbalancer1

# Response#[] is alias to Response#body[]
response[0]       #=> loadbalancer1
```

#### Servers
##### Add server
```ruby
# Get target config of loadbalancer
config = client.list_loadbalancers.body.first["configs"].first

# Specify of the adding target server IP address and port
adding_server =
  {
    ipaddress: "xxx.xxx.xxx.xxx",
    port: 80
  }

# Add server to config
response =
  client.add_server(
    config["loadbalancer_id"],
    config["id"],
    adding_server
  )

response #=> server array
```

##### Get servers
```ruby
loadbalancer = client.loadbalancers.body.first # Get one of the loadbalancer
config = loadbalancer["configs"].first # Get one of the loadbalancer's config hash
response = client.list_servers(loadbalancer["id"], config["id"])

response #=> server array
```

##### Delete server
```ruby
# Get one of the loadbalancer's config hash
config = client.list_loadbalancers.body.first["configs"].first

# Specify of the deletion target server IP address and port
deletion_server = config["servers"].first

response =
  client.delete_server(
    config["loadbalancer_id"],
    config["id"],
    deletion_server["id"]
  )

response #=> server array
```

## Contributing

1. Fork it ( https://github.com/idcf/idcf-ilb-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
