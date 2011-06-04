$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require "resqueue-metadata"

Resque.redis = "localhost:6379"
Resque.redis.namespace = "resqueue-metadata:test"

RSpec.configure do |c|
  c.before do
    Resque.redis.keys.each { |key| Resque.redis.del key }
  end
end
