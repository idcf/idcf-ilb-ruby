module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for server resource
      module Server
        # Add a loadbalancer config's server.
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param data [Hash] add server hash
        # @option data [String] :ipaddress  (required)
        # @option data [Integer] :port  (required)
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config server] hash
        def add_server(lb_id, config_id, data, headers = {})
          Validators::Server.validate_attributes!(data, :add)
          res = post!("loadbalancers/#{lb_id}/configs/#{config_id}/servers", data, headers)
          check_job(res.body["job_id"], headers, ["list_servers", lb_id, config_id], false)
        end

        # Get list of existing [loadbalancer's config servers]
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config server] hash
        def list_servers(lb_id, config_id, headers = {})
          res = get!("loadbalancers/#{lb_id}/configs/#{config_id}/servers", {}, headers)
          res.body
        end

        # Delete a [loadbalancer's config server]
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param id [String] ID of loadbalancer's config server
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config server] hash
        def delete_server(lb_id, config_id, id, headers = {})
          res = delete!("loadbalancers/#{lb_id}/configs/#{config_id}/servers/#{id}", {}, headers)
          check_job(res.body["job_id"], headers, ["list_servers", lb_id, config_id], false)
        end
      end
    end
  end
end
