module Idcf
  module Ilb
    module Resources
      # Sslpolicy resource class
      class Sslpolicy < Base
        # @return [Array<Sslpolicy>] an array of sslpolicies
        def algorithms
          return @algorithm_objects if @algorithm_objects
          refresh
          @algorithm_objects = @algorithms.map { |algo| Sslalgorithm.new(client, algo) }
        end

        # Refresh this sslpolicy
        #
        # @return [Sslpolicy] self object
        def refresh
          self.attributes = client.get_sslpolicy(id).body
          self
        end
      end
    end
  end
end
