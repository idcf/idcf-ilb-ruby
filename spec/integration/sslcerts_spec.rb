require "spec_helper"

describe Idcf::Ilb::ClientExtensions::Sslcert do
  include_context "resources"

  describe "#sslcerts" do
    before { @response = client.sslcerts }
    context "when valid request" do
      it do
        expect(@response).to be_an_instance_of(Array)
      end
    end
  end
end
