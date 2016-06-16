require "spec_helper"

describe Idcf::Ilb::ClientExtensions::Loadbalancer do
  include_context "resources"

  describe "#list_loadbalancer" do
    before { @response = client.list_loadbalancers }
    context "when valid request" do
      it do
        expect(@response.status).to eq 200
        expect(@response.success?).to be_truthy
        expect(@response.body).to be_an_instance_of(Array)
      end
    end
  end

  describe "#list_loadbalancer_resources_array" do
    before { @response = client.loadbalancers }

    context "when valid request" do
      it do
        expect(@response).to be_an_instance_of(Array)
      end
    end
  end
end
