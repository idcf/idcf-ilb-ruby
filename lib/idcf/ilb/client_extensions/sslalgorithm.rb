module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for sslalgorithm resource
      module Sslalgorithm
        # Get list of sslalgorithms
        #
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_sslalgorithms(headers = {})
          get!("sslpolicies/algorithms", {}, headers)
        end

        # Get a sslalgorithm
        #
        # @param id [String] ID of target sslalgorithm
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_sslalgorithm(id, headers = {})
          get!("sslpolicies/algorithms/#{id}", {}, headers)
        end

        # Get an array of sslalgorithm objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Sslalgorithm>] An array of sslalgorithm objects
        def sslalgorithms(headers = {})
          list_sslalgorithms(headers).resources.map do |sslalgorithm|
            Resources::Sslalgorithm.new(self, sslalgorithm)
          end
        end

        # Get a hash of sslalgorithm id array
        #
        # @param headers [Hash] HTTP request headers
        # @return {"algorithms": [ {"id": <sslalgorithm.id>}, ..*] }
        def sslalgorithms_ids(headers = {})
          { algorithms: sslalgorithms(headers).collect { |a| { id: a.id } } }
        end
      end
    end
  end
end
