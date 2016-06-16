module Idcf
  module Ilb
    module Resources
      # Nic resource class
      class Nic < Base
        # Inspect this class
        def inspect
          "#<#{self.class}:0x%014x @id=#{id} @network_name=#{network_name}>" % [object_id]
        end
      end
    end
  end
end
