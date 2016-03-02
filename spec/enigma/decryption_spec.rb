require "spec_helper"

describe Decryption do
  let(:decrypt) { Decryption.new("51569", "280216")}
  describe "#decrypt" do
    it "can decrypt any string" do
      expect(decrypt.decrypt("test")).to eql ",u9w"
    end
  end
end
