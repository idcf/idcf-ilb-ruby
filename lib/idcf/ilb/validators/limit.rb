module Idcf
  module Ilb
    module Validators
      # Limit validator class
      class Limit < Base
        self.valid_attributes = {
          loadbalancer_limit:   { type: Integer },
          sslcert_limit:        { type: Integer },
          sslpolicy_limit:      { type: Integer },
          fwgroup_limit:        { type: Integer },
          log_remain_month:     { type: Integer },
          traffic_remain_month: { type: Integer }
        }
      end
    end
  end
end
