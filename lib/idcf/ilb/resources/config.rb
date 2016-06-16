module Idcf
  module Ilb
    module Resources
      # Config resource class
      class Config < Base
        # Refresh this config
        #
        # @return [Config] self object
        def refresh
          self.attributes = client.get_config(id).body
          self
        end

        def inspect
          o_id = object_id
          "#<#{self.class}:0x%014x @protocol=#{frontend_protocol} @port=#{port} @id=#{id}>" % [o_id]
        end
      end
    end
  end
end
