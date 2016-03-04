require "spec_helper"
describe ENIGMA::PossibleKeys do
    subject { ENIGMA::PossibleKeys.new("test_crack.txt", "10316") }
  describe "#new" do
    it "creates a new instance" do
      expect(subject).to be_an_instance_of ENIGMA::PossibleKeys
    end
  end

  describe "#file_to_crack" do
    it "can read a file" do
      expect(subject.file_to_crack).to eql "gq,5nl2, o.r9qax9j"
    end
  end
  describe "#date_offset" do
    it "can read a file" do
      expect(subject.date_offset).to eql "9856"
    end
  end
  describe "#find_rotation" do
    it "can read a file" do
      expect(subject.find_rotation("d")).to eql 2
    end
  end
  describe "#key_position" do
    it "can read a file" do
      expect(subject.key_position(3)).to eql 2
    end
  end
  describe "#last_four_characters" do
    it "can read a file" do
      expect(subject.last_four_characters).to eql "ax9j"
    end
  end

  describe "#get_partial_key" do
    it "should return the correct multi dimensional array with correct rotation" do
      # allow(@possible_keys).to receive(:find_rotation) {2}
      expect(subject.get_partial_key("nd..")).to eql [["29", "68"], ["04", "43", "82"], ["21", "60", "99"], ["14", "53", "92"]]
    end
  end
end
