module Idcf
  module Ilb
    module Validators
      # Config validator class
      class Config < Base
        self.valid_attributes = {
          id:                  { type: String },
          loadbalancer_id:     { type: String },
          frontend_protocol:   { type: String, create: :required, patch: :optional },
          port:                { type: Integer, create: :required, patch: :optional },
          servers:             { type: Array, create: :required, patch: :optional },
          backend_protocol:    { type: String, create: :required, patch: :optional },
          sslcert_id:          { type: String, create: :optional, patch: :optional },
          sslpolicy_id:        { type: String, create: :optional, patch: :optional },
          connection_timeout:  { type: Integer, create: :required, patch: :optional },
          stickiness_policy:   { type: String, create: :optional, patch: :optional },
          algorithm:           { type: String, create: :required, patch: :optional },
          healthcheck:         { type: Hash, create: :required, patch: :optional },
          l7routes:            { type: Array, create: :optional },
          backupserver:        { type: Hash, create: :optional, patch: :optional },
          state:               { type: String },
          created_at:    { type: String },
          updated_at:    { type: String }
        }
      end
    end
  end
end
