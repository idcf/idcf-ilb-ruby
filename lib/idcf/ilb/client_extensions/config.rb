module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for config resource
      module Config
        # Create a new loadbalancer config.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :frontend_protocol  (required)
        # @option attributes [String] :port  (required)
        # @option attributes [String] :servers  (required)
        # @option attributes [String] :backend_protocol  (required)
        # @option attributes [String] :sslcert_id  (optional)
        # @option attributes [String] :sslpolicy_id  (optional)
        # @option attributes [String] :connection_timeout  (required)
        # @option attributes [String] :stickiness_policy  (optional)
        # @option attributes [String] :servers  (required)
        # @option attributes [String] :algorithm  (required)
        # @option attributes [String] :healthcheck  (required)
        # @option attributes [String] :backupserver  (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def create_config(lb_id, attributes, headers = {})
          Validators::Config.validate_attributes!(attributes, :create)
          res = post!("loadbalancers/#{lb_id}/configs", attributes, headers)
          check_job(res.body["job_id"], headers, ["list_configs", lb_id])
        end

        # Get list of existing configs
        #
        # @param lb_id [String] ID of loadbalancer
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_configs(lb_id, headers = {})
          get!("loadbalancers/#{lb_id}/configs", {}, headers)
        end

        # Get a config
        #
        # @param lb_id [String] ID of loadbalancer
        # @param id [String] ID of target config
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_config(lb_id, id, headers = {})
          get!("loadbalancers/#{lb_id}/configs/#{id}", {}, headers)
        end

        # Patch a config
        #
        # @param lb_id [String] ID of loadbalancer
        # @param id [String] ID of target config
        # @param attributes [Hash] request attributes
        # @option attributes [String] :frontend_protocol  (optional)
        # @option attributes [String] :port  (optional)
        # @option attributes [String] :servers  (optional)
        # @option attributes [String] :backend_protocol  (optional)
        # @option attributes [String] :sslcert_id  (optional)
        # @option attributes [String] :sslpolicy_id  (optional)
        # @option attributes [String] :connection_timeout  (optional)
        # @option attributes [String] :stickiness_policy  (optional)
        # @option attributes [String] :servers  (optional)
        # @option attributes [String] :algorithm  (optional)
        # @option attributes [String] :healthcheck  (optional)
        # @option attributes [String] :backupserver  (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def patch_config(lb_id, id, attributes, headers = {})
          Validators::Config.validate_attributes!(attributes, :patch)
          res = patch!("loadbalancers/#{lb_id}/configs/#{id}", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_config", lb_id, id])
        end

        # Delete a config
        #
        # @param lb_id [String] ID of loadbalancer
        # @param id [String] ID of target config
        # @param headers [Hash] HTTP request headers
        # @return [Boolean] delete success = true
        def delete_config(lb_id, id, headers = {})
          res = delete!("loadbalancers/#{lb_id}/configs/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Get an array of existing config objects.
        #
        # @param lb_id [String] ID of loadbalancer
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Config>] An array of config objects
        def configs(lb_id, headers = {})
          list_configs(lb_id, headers).resources.map do |config|
            Resources::Config.new(self, config)
          end
        end
      end
    end
  end
end
