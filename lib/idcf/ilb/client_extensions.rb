module Idcf
  module Ilb
    # This module includes SDK API methods for Client.
    module ClientExtensions
      def self.symbolize_keys(hash)
        hash.map { |k, v| [k.to_sym, v] }.to_h
      end
    end
  end
end

require "idcf/ilb/client_extensions/loadbalancer"
require "idcf/ilb/client_extensions/config"
require "idcf/ilb/client_extensions/server"
require "idcf/ilb/client_extensions/job"
require "idcf/ilb/client_extensions/sslcert"
require "idcf/ilb/client_extensions/sslalgorithm"
require "idcf/ilb/client_extensions/sslpolicy"
require "idcf/ilb/client_extensions/fwgroup"
require "idcf/ilb/client_extensions/network"
require "idcf/ilb/client_extensions/virtualmachine"
require "idcf/ilb/client_extensions/limit"
require "idcf/ilb/client_extensions/log"
require "idcf/ilb/client_extensions/traffic"
