module Idcf
  module Ilb
    module Validators
      # Virtualmachine validator class
      class Virtualmachine < Base
        self.valid_attributes = {
          id:            { type: String },
          name:          { type: String, list: :optional },
          account_id:    { type: String },
          domain:        { type: String },
          state:         { type: String },
          zone_id:       { type: String },
          zone_name:     { type: String },
          display_name:  { type: String },
          host_id:       { type: String },
          host_name:     { type: String },
          nics:          { type: Array },
          gateway:       { type: String },
          network_id:    { type: String },
          ipaddress:     { type: String },
          network_name:  { type: String }
        }
      end
    end
  end
end
