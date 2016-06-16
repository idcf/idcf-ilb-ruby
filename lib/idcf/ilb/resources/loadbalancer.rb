module Idcf
  module Ilb
    module Resources
      # Loadbalancer resource class
      class Loadbalancer < Base
        # Refresh this loadbalancer
        #
        # @return [Loadbalancer] self object
        def refresh
          self.attributes = client.get_loadbalancer(id).body
          self
        end
      end
    end
  end
end
