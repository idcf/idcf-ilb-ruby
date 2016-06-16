module Idcf
  module Ilb
    module Resources
      # Sslcert resource class
      class Sslcert < Base
        # Refresh this sslcert
        #
        # @return [Sslcert] self object
        def refresh
          self.attributes = client.get_sslcert(id).body
          self
        end
      end
    end
  end
end
