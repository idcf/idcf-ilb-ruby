module Idcf
  module Ilb
    module Validators
      # Sslalgorithm validator class
      class Sslalgorithm < Base
        self.valid_attributes = {
          id:         { type: String },
          protocol:   { type: String },
          cipher:     { type: String }
        }
      end
    end
  end
end
