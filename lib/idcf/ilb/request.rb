require "base64"
require "openssl"

module Idcf
  module Ilb
    # - Send HTTP request
    # - Generate signatures
    # - Set default expires
    class Request
      attr_reader :client, :method, :resource
      attr_reader :parameters

      # @private
      def initialize(client, method, resource, parameters, headers)
        @client       = client
        @method       = method
        @resource     = resource
        @parameters   = parameters
        @headers      = headers
      end

      # @private
      def send
        Response.new(
          client.connection.send(
            method,
            path,
            parameters,
            headers
          )
        )
      end

      # @private
      def headers
        auth_headers.merge(
          @headers.reject { |key, _| key.to_s == "X-IDCF-Expires" }
        )
      end

      private

      def api_key
        client.api_key
      end

      def auth_headers
        {
          "X-IDCF-Signature" => signature,
          "X-IDCF-APIKEY" => api_key,
          "X-IDCF-Expires" => expires
        }
      end

      def body
        if method == :post || method == :put || method == :patch
          parameters.to_json
        else
          ""
        end
      end

      def expires
        @expires ||=
          (@headers["X-IDCF-Expires"] || @headers[:"X-IDCF-Expires"] || Time.now.to_i + 600).to_s
      end

      def path
        "#{client.endpoint}/#{resource}"
      end

      def secret_key
        client.secret_key
      end

      def signature
        Base64.encode64(
          OpenSSL::HMAC.digest(
            OpenSSL::Digest::SHA256.new,
            secret_key,
            signature_seed
          )
        ).chomp
      end

      def signature_seed
        [
          method.to_s.upcase,
          path,
          api_key,
          expires,
          query_for_get
        ].join("\n")
      end

      def query_for_get
        return convert_params_to_query if method == :get && !parameters.empty?
        ""
      end

      def convert_params_to_query
        parameters.map { |k, v| "#{k}=#{CGI.escape(v.to_s).gsub(/\+|\ /, '%20')}" }.sort.join("&")
      end
    end
  end
end
