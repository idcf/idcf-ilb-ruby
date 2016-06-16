module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for sslcert resource
      module Sslcert
        # Create a new sslcert.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of sslcert (required)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def create_sslcert(attributes, headers = {})
          fixed_attributes = { type: "system" }
          attributes.merge!(fixed_attributes)
          Validators::Sslcert.validate_attributes!(attributes, :create)
          res = post!("sslcerts", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_sslcert"])
        end

        # Upload a sslcert.
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of sslcert (required)
        # @option attributes [String] :certificate certificate of sslcert (required)
        # @option attributes [String] :private_key private_key of sslcert (required)
        # @option attributes [String] :certificate_chain certificate_chain of sslcert (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def upload_sslcert(attributes, headers = {})
          fixed_attributes = { type: "self" }
          attributes.merge!(fixed_attributes)
          Validators::Sslcert.validate_attributes!(attributes, :upload)
          res = post!("sslcerts", attributes, headers)
          check_job(res.body["job_id"], headers, ["get_sslcert"])
        end

        # Get list of existing sslcerts
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name unique name of sslcert (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_sslcerts(attributes = {}, headers = {})
          Validators::Sslcert.validate_attributes!(attributes, :list)
          get!("sslcerts", attributes, headers)
        end

        # Get a sslcert
        #
        # @param id [String] ID of target sslcert
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_sslcert(id, headers = {})
          get!("sslcerts/#{id}", {}, headers)
        end

        # Delete a sslcert
        #
        # @param id [String] ID of target sslcert
        # @param headers [Hash] HTTP request headers
        # @return [Boolean] delete success = true
        def delete_sslcert(id, headers = {})
          res = delete!("sslcerts/#{id}", {}, headers)
          check_job(res.body["job_id"], headers)
        end

        # Get an array of existing sslcert objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Sslcert>] An array of sslcert objects
        def sslcerts(headers = {})
          list_sslcerts(headers).resources.map do |sslcert|
            Resources::Sslcert.new(self, sslcert)
          end
        end
      end
    end
  end
end
