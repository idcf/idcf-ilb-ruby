module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for limit resource
      module Limit
        # Get limit
        #
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_limit(headers = {})
          get!("limits", {}, headers)
        end

        # Get a limit object.
        #
        # @param headers [Hash] HTTP request headers
        # @return <Resources::Limit> a limit objects
        def limit(headers = {})
          Resources::Limit.new(self, get_limit(headers).body)
        end
      end
    end
  end
end
