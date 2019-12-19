module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for loadbalancer resource
      module Loadbalancer
        # Create a new loadbalancer.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of loadbalancer (required)
        # @option attributes [String] :network_id network_id of active network (required)
        # @option attributes [Object(true)] :public_ipaddress_assignment (optional)
        # @option attributes [Hash] :auto_scale_planning (optional)
        # @option attributes [Array] :configs configs of loadbalancer (required)
        # @option attributes [Hash] :mackerel mackerel (optional)
        # @option attributes [String] :fwgroup_id (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def create_loadbalancer(attributes, headers = {})
          Validators::Loadbalancer.validate_attributes!(attributes, :create)
          res = post!("loadbalancers", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_loadbalancer"])
        end

        # Update a loadbalancer.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of loadbalancer (required)
        # @option attributes [String] :certificate of loadbalancer (required)
        # @option attributes [String] :private_key of loadbalancer (required)
        # @option attributes [String] :certificate_chain of loadbalancer (optional)
        # @option attributes [Object(true)] :public_ipaddress_assignment (optional)
        # @option attributes [Hash] :auto_scale_planning (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def update_loadbalancer(id, attributes, headers = {})
          Validators::Loadbalancer.validate_attributes!(attributes, :update)
          res = put!("loadbalancers/#{id}", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_loadbalancer"])
        end

        # Get list of existing loadbalancers
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of loadbalancer (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_loadbalancers(attributes = {}, headers = {})
          Validators::Loadbalancer.validate_attributes!(attributes, :list)
          get!("loadbalancers", attributes, headers)
        end

        # Get a loadbalancer
        #
        # @param id [String] ID of target loadbalancer
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_loadbalancer(id, headers = {})
          get!("loadbalancers/#{id}", {}, headers)
        end

        # Delete a loadbalancer
        #
        # @param id [String] ID of target loadbalancer
        # @param headers [Hash] HTTP request headers
        # @return [Boolean] delete success = true
        def delete_loadbalancer(id, headers = {})
          res = delete!("loadbalancers/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Get an array of existing loadbalancer objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Loadbalancer>] An array of loadbalancer objects
        def loadbalancers(headers = {})
          list_loadbalancers({}, headers).resources.map do |loadbalancer|
            Resources::Loadbalancer.new(self, loadbalancer)
          end
        end
      end
    end
  end
end
