module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for virtualmachine resource
      module Virtualmachine
        # Get list of virtualmachines
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :name virtualmachine name (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_virtualmachines(attributes = {}, headers = {})
          Validators::Virtualmachine.validate_attributes!(attributes, :list)
          get!("virtualmachines", attributes, headers)
        end

        # Get an array of existing virtualmachine objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Virtualmachine>] An array of virtualmachine objects
        def virtualmachines(headers = {})
          list_virtualmachines(headers).resources.map do |virtualmachine|
            virtualmachine["host_id"] = "" if virtualmachine["host_id"].nil?
            virtualmachine["host_name"] = "" if virtualmachine["host_name"].nil?
            Resources::Virtualmachine.new(self, virtualmachine)
          end
        end
      end
    end
  end
end
