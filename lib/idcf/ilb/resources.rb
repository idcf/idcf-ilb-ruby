module Idcf
  module Ilb
    # ILB resources module
    module Resources
    end
  end
end

require "idcf/ilb/resources/base"
require "idcf/ilb/resources/loadbalancer"
require "idcf/ilb/resources/config"
require "idcf/ilb/resources/server"
require "idcf/ilb/resources/l7route"
require "idcf/ilb/resources/job"
require "idcf/ilb/resources/sslcert"
require "idcf/ilb/resources/sslalgorithm"
require "idcf/ilb/resources/sslpolicy"
require "idcf/ilb/resources/fwgroup"
require "idcf/ilb/resources/network"
require "idcf/ilb/resources/virtualmachine"
require "idcf/ilb/resources/limit"
require "idcf/ilb/resources/log"
require "idcf/ilb/resources/traffic"
