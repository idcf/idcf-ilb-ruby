module Idcf
  module Ilb
    module Validators
      # Fwgroup validator class
      class Fwgroup < Base
        self.valid_attributes = {
          id:            { type: String },
          name:          { type: String, create: :required },
          allow:         { type: Array, create: :any_cidr },
          drop:          { type: Array, create: :any_cidr },
          created_at:    { type: String },
          updated_at:    { type: String }
        }
      end
    end
  end
end
