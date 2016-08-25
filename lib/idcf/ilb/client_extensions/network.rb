module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for network resource
      module Network
        # Get list of networks
        #
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_networks(headers = {})
          get!("networks", {}, headers)
        end

        # Get an array of existing network objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Network>] An array of network objects
        def networks(headers = {})
          list_networks(headers).resources.map do |network|
            network["account_id"] = "" if network["account_id"].nil?
            Resources::Network.new(self, network)
          end
        end
      end
    end
  end
end
