module Idcf
  module Ilb
    module Resources
      # Job resource class
      class Job < Base
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
