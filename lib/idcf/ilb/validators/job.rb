module Idcf
  module Ilb
    module Validators
      # Job validator class
      class Job < Base
        self.valid_attributes = {
          id:                  { type: String },
          resource:            { type: String, list: :optional },
          resource_id:         { type: String },
          path:                { type: String },
          method:              { type: String, list: :required },
          created_at:          { type: String },
          updated_at:          { type: String }
        }
      end
    end
  end
end
