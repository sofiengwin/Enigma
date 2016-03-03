require "spec_helper"
describe ENIGMA::Cracker do
  subject { ENIGMA::Cracker.new("nd..", "020316", "encrypted.txt") }

  describe "#new" do
    it { expect(subject).to be_an_instance_of ENIGMA::Cracker}
  end

  describe "#find_key" do
    it "should a multi dimentionsional array containing the key" do
      expect(subject.find_key(subject.get_partial)).to ""
    end
  end
end
