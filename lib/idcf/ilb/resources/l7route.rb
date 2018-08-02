module Idcf
  module Ilb
    module Resources
      # Server resource class
      class L7route < Base
        def inspect
          o_id = object_id
          "#<#{self.class}:0x%014x @name=#{name} @id=#{id}>" % [o_id]
        end
      end
    end
  end
end
