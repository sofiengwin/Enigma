require "spec_helper"
describe ENIGMATICCRACKER::Crack do
  subject { ENIGMATICCRACKER::Crack.new("nd..", "020316", "encrypted.txt") }

  describe "#new" do
    it { expect(subject).to be_an_instance_of ENIGMATICCRACKER::Crack}
  end

  describe "#find_key" do
    it "should a multi dimentionsional array containing the key" do
      expect(subject.find_key(subject.get_partial)).to eql [["21"], ["18"], ["86"], ["63"]]
    end
  end
end
