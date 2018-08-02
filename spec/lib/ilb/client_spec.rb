require "spec_helper"
require "idcf/ilb/client"

describe Idcf::Ilb::Client do
  let(:api_key) { "hoe" }
  let(:secret_key) { "hoge" }
  let(:host) { "hoge" }
  let(:client) { described_class.new(api_key: api_key, secret_key: secret_key) }
  let(:lb_id) { "12356789-1234-1234-12345678901234567" }
  let(:config_id) { "12356789-1234-1234-12345678901234567" }
  let(:l7route_id) { "12356789-1234-1234-12345678901234567" }
  let(:data) do
    {
      name: "hoge",
      servers: [
        { ipaddress: "123.123.123.123", port: 80 },
        { ipaddress: "456.456.456.456", port: 80 }
      ],
      criterion: "path_beg",
      pattern: "/images/"
    }
  end

  describe "Idcf::Ilb::ClientExtensions::L7route" do
    describe "get_l7route" do
      describe "invalid" do
        it "no parameter" do
          expect { client.get_l7route }.to raise_error(ArgumentError)
        end
      end
    end

    describe "list_l7routes" do
      describe "invalid" do
        it "no parameter" do
          expect { client.list_l7routes }.to raise_error(ArgumentError)
        end
      end
    end

    describe "l7routes" do
      describe "invalid" do
        it "no parameter" do
          expect { client.l7routes }.to raise_error(ArgumentError)
        end
      end
    end

    describe "delete_l7route" do
      describe "invalid" do
        it "no parameter" do
          expect { client.delete_l7route }.to raise_error(ArgumentError)
        end
      end
    end

    describe "create_l7route" do
      describe "invalid" do
        it "no parameter" do
          expect { client.create_l7route }.to raise_error(ArgumentError)
        end

        it "invalid name" do
          data[:name] = 123
          message = "`name` is required to be a String"
          expect do
            client.create_l7route(lb_id, config_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid servers" do
          data[:servers] = 123
          message = "`servers` is required to be a Array"
          expect do
            client.create_l7route(lb_id, config_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid criterion" do
          data[:criterion] = 123
          message = "`criterion` is required to be a String"
          expect do
            client.create_l7route(lb_id, config_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid pattern" do
          data[:pattern] = 123
          message = "`pattern` is required to be a String"
          expect do
            client.create_l7route(lb_id, config_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end
      end
    end

    describe "patch_l7route" do
      describe "invalid" do
        it "no parameter" do
          expect { client.patch_l7route }.to raise_error(ArgumentError)
        end

        it "invalid name" do
          data[:name] = 123
          message = "`name` is required to be a String"
          expect do
            client.patch_l7route(lb_id, config_id, l7route_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid servers" do
          data[:servers] = 123
          message = "`servers` is required to be a Array"
          expect do
            client.patch_l7route(lb_id, config_id, l7route_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid criterion" do
          data[:criterion] = 123
          message = "`criterion` is required to be a String"
          expect do
            client.patch_l7route(lb_id, config_id, l7route_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end

        it "invalid pattern" do
          data[:pattern] = 123
          message = "`pattern` is required to be a String"
          expect do
            client.patch_l7route(lb_id, config_id, l7route_id, data)
          end.to raise_error(Idcf::Ilb::InvalidAttributeType, message)
        end
      end
    end
  end
end
