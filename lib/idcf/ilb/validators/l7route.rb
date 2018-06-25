module Idcf
  module Ilb
    module Validators
      # L7route validator class
      class L7route < Base
        self.valid_attributes = {
          name:       { type: String, create: :required, patch: :optional },
          servers:    { type: Array,  create: :required, patch: :optional },
          criterion:  { type: String, create: :required, patch: :optional },
          pattern:    { type: String, create: :required, patch: :optional },
        }
      end
    end
  end
end
