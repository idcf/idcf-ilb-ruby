module Idcf
  module Ilb
    module Validators
      # Traffic validator class
      class Traffic < Base
        self.valid_attributes = {
          from:        { type: String, list: :optional },
          to:          { type: String, list: :optional },
          unit:        { type: String, list: :optional },
          total_public_in:  { type: Integer },
          total_public_out: { type: Integer },
          total_local_in:   { type: Integer },
          total_local_out:  { type: Integer },
          created_at:       { type: String }
        }
      end
    end
  end
end
