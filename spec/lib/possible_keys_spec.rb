  require "spec_helper"
describe ENIGMATICKEYS::PossibleKeys do
  before :each do
    @possible_keys = ENIGMATICKEYS::PossibleKeys.new("nd..", "10316", "encrypted.txt")
    # allow(@possible_keys).to receive(:file_to_crack) {"hello"}
  end
describe "#new" do
  it "creates a new instance"
  end

  describe "#file_to_crack" do
    it "can read a file" do
      expect(@possible_keys.file_to_crack).to eql "hello test"
    end
  end
  describe "#date_offset" do
    it "can read a file" do
      expect(@possible_keys.date_offset).to eql "hello"
    end
  end
  describe "#find_rotation" do
    it "can read a file" do
      expect(@possible_keys.find_rotation("w")).to eql "hello"
    end
  end
  describe "#key_position" do
    it "can read a file" do
      expect(@possible_keys.key_position(3)).to eql "hello"
    end
  end
  describe "#last_four_characters" do
    it "can read a file" do
      expect(@possible_keys.last_four_characters).to eql "hello"
    end
  end

  describe "#get_partial_key" do
    it "should return the correct rotation" do
      # allow(@possible_keys).to receive(:find_rotation).with("o")
      expect(@possible_keys.get_partial_key[0]).to eql ["25", "51", "77"]
      expect(@possible_keys.get_partial_key[1]).to eql ["15", "41", "67", "93"]
      expect(@possible_keys.get_partial_key[2]).to eql ["04", "30", "56", "82"]
      expect(@possible_keys.get_partial_key[3]).to eql ["17", "43", "69", "95"]
    end
  end
end
