module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for traffic resource
      module Traffic
        # Get list of traffics by account
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :from (optional)
        # @option attributes [String] :to (optional)
        # @option attributes [String] :unit (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_traffics_by_account(attributes = {}, headers = {})
          Validators::Traffic.validate_attributes!(attributes, :list)
          get!("traffics", attributes, headers)
        end

        # Get traffic by loadbalancer
        #
        # @param loadbalancer_id [String] ID of target loadbalancer
        # @param attributes [Hash] request attributes
        # @option attributes [String] :from (optional)
        # @option attributes [String] :to (optional)
        # @option attributes [String] :unit (optional) (MB|GB|TB)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_traffic_by_loadbalancer(loadbalancer_id, attributes = {}, headers = {})
          Validators::Traffic.validate_attributes!(attributes, :list)
          get!("traffics/loadbalancers/#{loadbalancer_id}", attributes, headers)
        end
      end
    end
  end
end
