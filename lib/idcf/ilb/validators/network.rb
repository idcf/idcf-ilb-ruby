module Idcf
  module Ilb
    module Validators
      # Network validator class
      class Network < Base
        self.valid_attributes = {
          account_id:   { type: String },
          id:           { type: String },
          name:         { type: String },
          networkcidr:  { type: String },
          domainid:     { type: String },
          domain:       { type: String },
          gateway:      { type: String },
          networkoffering_id:    { type: String },
          networkoffering_name:  { type: String },
          state:        { type: String },
          traffic_type: { type: String },
          related:      { type: String },
          zone_id:      { type: String },
          zone_name:    { type: String }
        }
      end
    end
  end
end
