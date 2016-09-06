require "active_support"
require "faraday"
require "faraday_middleware"

module Idcf
  module Ilb
    # Client for IDCF ILB service
    class Client
      include ClientExtensions::Loadbalancer
      include ClientExtensions::Config
      include ClientExtensions::Server
      include ClientExtensions::Job
      include ClientExtensions::Sslcert
      include ClientExtensions::Sslalgorithm
      include ClientExtensions::Sslpolicy
      include ClientExtensions::Fwgroup
      include ClientExtensions::Network
      include ClientExtensions::Virtualmachine
      include ClientExtensions::Limit
      include ClientExtensions::Log
      include ClientExtensions::Traffic

      attr_reader :api_key, :secret_key, :host, :endpoint, :ssl

      # The constructor of Ilb::Client uses keyword arguments.
      #
      # @param [String] api_key API key for IDCF Cloud
      # @param [String] secret_key Secret key for IDCF Cloud
      def initialize(api_key:,
                     secret_key:,
                     host: "ilb.jp-east.idcfcloud.com",
                     endpoint: "/api/v1",
                     ssl: true,
                     verify_ssl: true
                    )

        @api_key    = api_key
        @secret_key = secret_key
        @host       = host
        @endpoint   = endpoint
        @ssl = ssl
        @verify_ssl = verify_ssl
      end

      # @private
      def connection
        @connection ||=
          Faraday.new(url: url_prefix, ssl: ssl_options) do |connection|
            connection.request :json
            connection.response :json
            connection.adapter Faraday.default_adapter
          end
      end

      # Send DELETE request.
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def delete(resource, parameters = {}, headers = {})
        send(:delete, resource, parameters, headers)
      end

      # Send DELETE request with handling error
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def delete!(resource, parameters = {}, headers = {})
        send!(:delete, resource, parameters, headers)
      end

      # Send GET request
      #
      # @param resource [String] Resource name
      # @param parameters [Hash] Parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def get(resource, parameters = {}, headers = {})
        send(:get, resource, parameters, headers)
      end

      # Send GET request with handling error
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def get!(resource, parameters = {}, headers = {})
        send!(:get, resource, parameters, headers)
      end

      # Send POST request
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def post(resource, parameters = {}, headers = {})
        send(:post, resource, parameters, headers)
      end

      # Send POST request with handling error
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def post!(resource, parameters = {}, headers = {})
        send!(:post, resource, parameters, headers)
      end

      # Send PUT request
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def put(resource, parameters = {}, headers = {})
        send(:put, resource, parameters, headers)
      end

      # Send PUT request with handling error
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def put!(resource, parameters = {}, headers = {})
        send!(:put, resource, parameters, headers)
      end

      # Send PATCH request
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def patch(resource, parameters = {}, headers = {})
        send(:patch, resource, parameters, headers)
      end

      # Send PATCH request with handling error
      #
      # @param resource [String] resource name
      # @param parameters [Hash] request parameters
      # @param headers [Hash] HTTP request headers
      # @return [Response] Response object
      def patch!(resource, parameters = {}, headers = {})
        send!(:patch, resource, parameters, headers)
      end

      private

      def send(method, resource, parameters = {}, headers = {})
        Request.new(self, method, resource, parameters, headers).send
      end

      def send!(method, resource, parameters = {}, headers = {})
        response = send(method, resource, parameters, headers)
        unless response.success?
          raise(
            ApiError,
            "HTTP status code: #{response.status}, " \
            "Error message: #{response.message}, " \
            "Reference: #{response.reference}"
          )
        end
        response
      end

      def protocol
        ssl ? "https" : "http"
      end

      def ssl_options
        { verify: @verify_ssl }
      end

      def url_prefix
        "#{protocol}://#{host}"
      end
    end
  end
end
