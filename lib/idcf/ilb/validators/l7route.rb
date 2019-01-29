module Idcf
  module Ilb
    module Validators
      # L7route validator class
      class L7route < Base
        self.valid_attributes = {
          id:         { type: String },
          servers:    { type: Array,  create: :required, patch: :optional },
          pattern:    { type: String, create: :required, patch: :optional },
          created_at: { type: String },
          updated_at: { type: String }
        }
      end
    end
  end
end
