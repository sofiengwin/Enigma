  require "spec_helper"
describe ENIGMATICKEYS::PossibleKeys do
  before :each do
    @possible_keys = ENIGMATICKEYS::PossibleKeys.new("nd..", "10316", "test.txt")
    # allow(@possible_keys).to receive(:file_to_crack) {"hello"}
  end
describe "#new" do
  it "creates a new instance"
  end

  describe "#file_to_crack" do
    it "can read a file" do
      expect(@possible_keys.file_to_crack).to eql "hello world"
    end
  end
  describe "#date_offset" do
    it "can read a file" do
      expect(@possible_keys.date_offset).to eql "9856"
    end
  end
  describe "#find_rotation" do
    it "can read a file" do
      expect(@possible_keys.find_rotation("d")).to eql 2
    end
  end
  describe "#key_position" do
    it "can read a file" do
      expect(@possible_keys.key_position(3)).to eql 2
    end
  end
  describe "#last_four_characters" do
    it "can read a file" do
      expect(@possible_keys.last_four_characters).to eql "orld"
    end
  end

  describe "#get_partial_key" do
    it "should return the correct multi dimensional array with correct rotation" do
      # allow(@possible_keys).to receive(:find_rotation).with("o")
      expect(@possible_keys.get_partial_key[0]).to eql ["05", "44", "83"]
      expect(@possible_keys.get_partial_key[1]).to eql
      expect(@possible_keys.get_partial_key[2]).to eql
      expect(@possible_keys.get_partial_key[3]).to eql
    end
  end
end
