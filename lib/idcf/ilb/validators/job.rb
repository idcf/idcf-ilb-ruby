module Idcf
  module Ilb
    module Validators
      # Job validator class
      class Job < Base
        self.valid_attributes = {
          id:                  { type: String },
          account_id:          { type: String },
          job_status:          { type: String },
          result_code:         { type: Integer, list: :optional },
          resource:            { type: String, list: :optional },
          resource_id:         { type: String },
          path:                { type: String },
          method:              { type: String, list: :optional },
          created_at:          { type: String },
          updated_at:          { type: String },
          limit:               { type: Integer, list: :optional },
          offset:              { type: Integer, list: :optional }
        }
      end
    end
  end
end
