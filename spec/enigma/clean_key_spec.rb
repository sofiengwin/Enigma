require "spec_helper"
describe ENIGMA::Crack do
  subject { ENIGMA::Crack.new("nd..", "020316", "encrypted.txt")}

  describe "#new" do
    it {expect(subject).to be_an_instance_of ENIGMA::Crack}
  end

  describe "#clean_key" do
    it "it should return the correct key as a string" do
      expect(subject.clean_key).to eql "21863"
    end
  end
end
