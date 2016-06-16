module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for log resource
      module Log
        # Get list of logs
        #
        # @param attributes [Hash] request attributes
        # @option attributes [Integer] :page (optional)
        # @option attributes [Integer] :per_page (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_logs(attributes = {}, headers = {})
          Validators::Log.validate_attributes!(attributes, :list)
          get!("logs", attributes, headers)
        end

        # Get an array of existing log objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Log>] An array of log objects
        def logs(headers = {})
          list_logs(headers).resources.map do |log|
            Resources::Log.new(self, log)
          end
        end
      end
    end
  end
end
