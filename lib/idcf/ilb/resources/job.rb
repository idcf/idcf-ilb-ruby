module Idcf
  module Ilb
    module Resources
      # Job resource class
      class Job < Base
        def inspect
          "#<#{self.class}:0x%014x @id=#{id} @resource_id=#{resource_id}>" % [object_id]
        end

        # Refresh this job
        #
        # @return [Job] self object
        def refresh
          self.attributes = client.get_job(id).body
          self
        end
      end
    end
  end
end
