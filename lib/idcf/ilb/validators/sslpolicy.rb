module Idcf
  module Ilb
    module Validators
      # Sslpolicy validator class
      class Sslpolicy < Base
        self.valid_attributes = {
          id:            { type: String },
          account_id:    { type: String },
          name:          { type: String, create: :required },
          algorithms:    { type: Array, create: :required },
          state:         { type: String },
          created_at:    { type: String },
          updated_at:    { type: String }
        }
      end
    end
  end
end
