RSpec.describe Mig::Elasticsearch::Client do
  describe "#Indicies" do
    it "returns an array of index-data" do
      client = Mig::Elasticsearch::Client.new

      response = {
        body: JSON.generate({foo: "bar"}),
        status: 200,
      }
      stub_request(:get, "http://localhost:9200/_cat/indices?v").to_return(response)

      results = client.indices
      expect(results).to eq({"foo" => "bar"})
    end
  end
end
