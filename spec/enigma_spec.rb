require "spec_helper"

describe EnigmaEncrpt do
  before :each do
    @new_encryption = EnigmaEncrpt.new
    @encrypt = Encryption.new
  end

  describe "#new" do
    encrypt = EnigmaEncrpt.new
    it "should create a new instance" do
      encrypt.should be_an_instance_of EnigmaEncrpt
    end
  end

  describe "#start_encryption" do
    it "should return a different text than the one given" do
      expect(@encrypt.encrypt("hello world")).not_to eql "hello world"
    end
  end
end
