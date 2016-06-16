module Idcf
  module Ilb
    module Resources
      # Limit resource class
      class Limit < Base
        # Inspect this class
        def inspect
          "#<#{self.class}:0x%014x>" % [object_id]
        end
      end
    end
  end
end
