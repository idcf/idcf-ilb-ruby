module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for sslpolicy resource
      module Sslpolicy
        # Create a new sslpolicy.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of sslpolicy (required)
        # @option attributes [Array] :algorithms array of sslalgorithm IDs (required)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def create_sslpolicy(attributes, headers = {})
          Validators::Sslpolicy.validate_attributes!(attributes, :create)
          res = post!("sslpolicies", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_sslpolicy"])
        end

        # Get list of existing sslpolicies
        #
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_sslpolicies(headers = {})
          get!("sslpolicies", {}, headers)
        end

        # Get a sslpolicy
        #
        # @param id [String] ID of target sslpolicy
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_sslpolicy(id, headers = {})
          get!("sslpolicies/#{id}", {}, headers)
        end

        # Delete a sslpolicy
        #
        # @param id [String] ID of target sslpolicy
        # @param headers [Hash] HTTP request headers
        # @return [Boolean] delete success = true
        def delete_sslpolicy(id, headers = {})
          res = delete!("sslpolicies/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Get an array of existing sslpolicy objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Sslpolicy>] An array of sslpolicy objects
        def sslpolicies(headers = {})
          list_sslpolicies(headers).resources.map do |sslpolicy|
            Resources::Sslpolicy.new(self, sslpolicy)
          end
        end
      end
    end
  end
end
