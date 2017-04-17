module Idcf
  module Ilb
    module Validators
      # Sslcert validator class
      class Sslcert < Base
        self.valid_attributes = {
          id:            { type: String },
          name:          { type: String, create: :required, upload: :required, list: :optional },
          type:          { type: String, create: :required, upload: :required },
          certificate:         { type: String, upload: :required },
          private_key:         { type: String, upload: :required },
          certificate_chain:   { type: String, upload: :optional },
          fqdn:                { type: String },
          state:               { type: String },
          fingerprint:         { type: String },
          remaining_days:      { type: Integer },
          expired_at:          { type: String },
          created_at:    { type: String },
          updated_at:    { type: String },
          ats_flag:      { type: "boolean" }
        }
      end
    end
  end
end
