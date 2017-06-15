require "spec_helper"

describe Idcf::Ilb::ClientExtensions::Job do
  include_context "resources"
  let(:param_limit) do
    { limit: 10 }
  end
  let(:param_offset) do
    { offset: 1 }
  end
  describe "#list_jobs" do
    context "when valid request" do
      subject(:no_param) do
        client.list_jobs
      end
      subject(:limit) do
        client.list_jobs(param_limit)
      end
      subject(:offset) do
        client.list_jobs(param_offset)
      end
      it "no parameter" do
        res = no_param
        expect(res.status).to eq 200
        expect(res.success?).to be_truthy
        expect(res.body).to be_an_instance_of(Array)
        expect(res.body.count).to be <= 1000
      end
      it "parameter has limit" do
        res = limit
        expect(res.status).to eq 200
        expect(res.success?).to be_truthy
        expect(res.body).to be_an_instance_of(Array)
        expect(res.body.count).to eq 10
      end
      it "parameter has offset" do
        default = no_param
        offset_res = offset
        expect(offset_res.status).to eq 200
        expect(offset_res.success?).to be_truthy
        expect(offset_res.body).to be_an_instance_of(Array)
        expect(offset_res.body.count).to be <= 1000
        expect(offset_res.body[0]["id"]).to eq default.body[1]["id"]
      end
    end
  end
end
