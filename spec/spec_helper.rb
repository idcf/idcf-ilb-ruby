require "simplecov"
SimpleCov.start do
  add_filter "vendor"
  add_filter "spec"
end

if ENV["CI"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

dotenv_path = File.expand_path("../../.env", __FILE__)
if File.exist?(dotenv_path)
  require "dotenv"
  Dotenv.load(dotenv_path)
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "idcf/ilb"

PREFIX = rand(16**8).to_s(16)

LOADBALANCERS = []
CONFIGS = []
SSLCERTS = []
SSLPOLICIES = []
FWGROUPS = []

auth_args = {
  api_key: ENV["IDCF_API_KEY"],
  secret_key: ENV["IDCF_SECRET_KEY"],
  host: ENV["ILB_API_HOST"] || "ilb.jp-east.idcfcloud.com",
  verify_ssl: ENV["VERIFY_SSL"] != "false"
}

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end

shared_context "resources" do
  let(:client) { Idcf::Ilb::Client.new(auth_args) }
end
