require "idcf/ilb/errors"

# IDCF Cloud SDK
module Idcf
  module Ilb
    autoload :Client          , "idcf/ilb/client"
    autoload :ClientExtensions, "idcf/ilb/client_extensions"
    autoload :Request         , "idcf/ilb/request"
    autoload :Resources       , "idcf/ilb/resources"
    autoload :Response        , "idcf/ilb/response"
    autoload :Validators      , "idcf/ilb/validators"
  end
end
