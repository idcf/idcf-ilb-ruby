module Idcf
  module Ilb
    module Resources
      # Virtualmachine resource class
      class Virtualmachine < Base
        # Inspect this class
        def inspect
          "#<#{self.class}:0x%014x @id=#{id} @name=#{name} @zone_name=#{zone_name}>" % [object_id]
        end
      end
    end
  end
end
