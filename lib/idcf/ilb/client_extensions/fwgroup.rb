module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for fwgroup resource
      module Fwgroup
        # Create a new fwgroup.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of fwgroup (required)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def create_fwgroup(attributes, headers = {})
          Validators::Fwgroup.validate_attributes!(attributes, :create)
          res = post!("fwgroups", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_fwgroup"])
        end

        # Get list of existing fwgroups
        #
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_fwgroups(headers = {})
          get!("fwgroups", {}, headers)
        end

        # Get a fwgroup
        #
        # @param id [String] ID of target fwgroup
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_fwgroup(id, headers = {})
          get!("fwgroups/#{id}", {}, headers)
        end

        # Delete a fwgroup
        #
        # @param id [String] ID of target fwgroup
        # @param headers [Hash] HTTP request headers
        # @return [Boolean] delete success = true
        def delete_fwgroup(id, headers = {})
          res = delete!("fwgroups/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Get an array of existing fwgroup objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Fwgroup>] An array of fwgroup objects
        def fwgroups(headers = {})
          list_fwgroups(headers).resources.map do |fwgroup|
            Resources::Fwgroup.new(self, fwgroup)
          end
        end
      end
    end
  end
end
