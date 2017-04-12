require "spec_helper"
require "base64"
require "openssl"

describe Idcf::Ilb::Request do
  include_context "resources"

  describe "#headers" do
    context "Signature" do
      it "with get param" do
        request_params = { per_page: 2 }
        headers = Idcf::Ilb::Request.new(client, :get, "logs", request_params, {}).headers
        sig = signature(:get, headers["X-IDCF-Expires"], request_params)
        expect(headers["X-IDCF-Signature"]).to eq sig
      end

      it "no get param" do
        request_params = {}
        headers = Idcf::Ilb::Request.new(client, :get, "logs", request_params, {}).headers
        sig = signature(:get, headers["X-IDCF-Expires"], request_params)
        expect(headers["X-IDCF-Signature"]).to eq sig
      end
    end
  end
end

def signature(method, expires, param)
  q = ""
  q = convert_query(param) unless param.empty?
  seed = [
    method.to_s.upcase,
    "/api/v1/logs",
    ENV["IDCF_API_KEY"],
    expires,
    q
  ].join("\n")
  sig = Base64.encode64(
    OpenSSL::HMAC.digest(
      OpenSSL::Digest::SHA256.new,
      ENV["IDCF_SECRET_KEY"],
      seed
    )
  ).chomp
  sig
end

def convert_query(param)
  param.map { |k, v| "#{k}=#{CGI.escape(v.to_s).gsub(/\+|\ /, '%20')}" }.sort.join("&")
end
