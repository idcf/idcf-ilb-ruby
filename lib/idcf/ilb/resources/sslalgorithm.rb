module Idcf
  module Ilb
    module Resources
      # Sslalgorithm resource class
      class Sslalgorithm < Base
        # Refresh this sslalgorithm
        #
        # @return [Sslalgorithm] self object
        def refresh
          self.attributes = client.get_sslalgorithm(id).body
          self
        end

        # Inspect this class
        def inspect
          "#<#{self.class}:0x%014x @protocol=#{protocol} @cipher=#{cipher} @id=#{id}>" % [object_id]
        end
      end
    end
  end
end
