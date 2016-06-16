module Idcf
  module Ilb
    module Resources
      # Fwgroup resource class
      class Fwgroup < Base
        # Refresh this fwgroup
        #
        # @return [Fwgroup] self object
        def refresh
          self.attributes = client.get_fwgroup(id).body
          self
        end
      end
    end
  end
end
