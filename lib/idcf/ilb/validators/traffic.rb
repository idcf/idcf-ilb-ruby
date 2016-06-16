module Idcf
  module Ilb
    module Validators
      # Traffic validator class
      class Traffic < Base
        self.valid_attributes = {
          from:        { type: String, list: :optional },
          to:          { type: String, list: :optional },
          unit:        { type: String, list: :optional }
        }
      end
    end
  end
end
