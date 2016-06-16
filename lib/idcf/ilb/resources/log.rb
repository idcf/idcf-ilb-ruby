module Idcf
  module Ilb
    module Resources
      # Log resource class
      class Log < Base
        # Inspect this class
        def inspect
          "#<#{self.class}:0x%014x @user_id=#{user_id} @level=#{level}>" % [object_id]
        end
      end
    end
  end
end
