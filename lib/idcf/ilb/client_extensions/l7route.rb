module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for l7route resource
      module L7route
        # Create a loadbalancer config's l7route.
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param data [Hash] add l7route hash
        # @option data [Hash] :servers  (required)
        # @option data [String] :pattern  (required)
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config server] hash
        def create_l7route(lb_id, config_id, data, headers = {})
          Validators::L7route.validate_attributes!(data, :create)
          res = post!("loadbalancers/#{lb_id}/configs/#{config_id}/l7routes", data, headers)
          check_job(res.body["job_id"], headers, ["get_l7route", lb_id, config_id, res.body["resource_id"]], false)
        end

        # Get list of existing [loadbalancer's config l7routes]
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config l7route] hash
        def list_l7routes(lb_id, config_id, headers = {})
          get!("loadbalancers/#{lb_id}/configs/#{config_id}/l7routes", {}, headers)
        end

        # Get of existing [loadbalancer's config l7route]
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param id [String] ID of loadbalancer's config l7route
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config l7route] hash
        def get_l7route(lb_id, config_id, id, headers = {})
          get!("loadbalancers/#{lb_id}/configs/#{config_id}/l7routes/#{id}", {}, headers)
        end

        # Delete a [loadbalancer's config l7route]
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param id [String] ID of loadbalancer's config l7route
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config l7route] hash
        def delete_l7route(lb_id, config_id, id, headers = {})
          res = delete!("loadbalancers/#{lb_id}/configs/#{config_id}/l7routes/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Patch a l7route.
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param id [String] ID of loadbalancer's config l7route
        # @param data [Hash] add l7route hash
        # @option data [Hash] :servers  (required)
        # @option data [String] :pattern  (required)
        # @param headers [Hash] HTTP request headers
        # @return [Array<Hash>] An array of [loadbalancer's config server] hash
        def patch_l7route(lb_id, config_id, id, data, headers = {})
          Validators::L7route.validate_attributes!(data, :patch)
          res = patch!("loadbalancers/#{lb_id}/configs/#{config_id}/l7routes/#{id}", data, headers)
          check_job(res.body["job_id"], headers, ["get_l7route", lb_id, config_id, id], false)
        end

        # Get an array of existing l7routes objects.
        #
        # @param lb_id [String] ID of loadbalancer
        # @param config_id [String] ID of loadbalancer's config
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::L7route>] An array of l7route objects
        def l7routes(lb_id, config_id, headers = {})
          list_l7routes(lb_id, config_id, headers).resources.map do |l7route|
            Resources::L7route.new(self, l7route)
          end
        end
      end
    end
  end
end
