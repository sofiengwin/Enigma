require "spec_helper"
describe ENIGMA::Cracker do
  subject { ENIGMA::PossibleKeys.new("./spec/enigma/test_files/test_file.txt", "020316") }

  describe "#find_key" do
    it "should a multi dimentionsional array containing the key" do
      expect(ENIGMA::Cracker.find_key(subject.get_partial_key("nd.."))).to eql [["68"], ["82"], ["21"], ["14"]]
    end
  end
end
