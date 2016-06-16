module Idcf
  module Ilb
    module Validators
      # Loadbalancer validator class
      class Loadbalancer < Base
        self.valid_attributes = {
          id:                  { type: String },
          account_id:          { type: String },
          name:                { type: String, create: :required },
          network_id:          { type: String, create: :required },
          network_name:        { type: String },
          network:             { type: Hash },
          configs:             { type: Array, create: :required, update: :required },
          mackerel:            { type: Hash, create: :optional, update: :optional },
          fqdn:                { type: String },
          state:               { type: String },
          zone_id:             { type: String },
          zone_name:           { type: String },
          fwgroup_id:          { type: String, create: :optional, update: :optional },
          created_at:          { type: String },
          updated_at:          { type: String }
        }
      end
    end
  end
end
