module Idcf
  module Ilb
    module Validators
      # Log validator class
      class Log < Base
        self.valid_attributes = {
          # for search
          page:        { type: Integer, list: :optional },
          per_page:    { type: Integer, list: :optional },
          # resource attributes
          user_id:     { type: String },
          account_id:  { type: String },
          level:       { type: String },
          type:        { type: String },
          text:        { type: String },
          user_name:   { type: String },
          created_at:  { type: String }
        }
      end
    end
  end
end
