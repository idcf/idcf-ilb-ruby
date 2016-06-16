module Idcf
  module Ilb
    module Validators
      # Server validator class
      class Server < Base
        self.valid_attributes = {
          ipaddress:     { type: String, add: :required },
          port:          { type: Integer, add: :required }
        }
      end
    end
  end
end
