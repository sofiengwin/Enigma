require "spec_helper"

describe EnigmaEncrpt do
  before :each do
    @encrypt = EnigmaEncrpt.new("test.txt", "encrypted.txt")
  end

  describe "#new" do
    it "should create a new instance" do
      expect(@encrypt).to be_an_instance_of EnigmaEncrpt
    end
  end

  describe "#start_encryption" do
    it "should return a different text than the one given" do
      expect(@encrypt.start_encryption).not_to eql "hello world"
    end
  end
  describe "#file_to_encrypt" do
    context "it returns a string with the correct argument" do
      it "should return a string from the file given" do
        expect(@encrypt.file_to_encrypt).to eql "hello worldnd.."
      end
    end
    # context "it exits the system if no argument is given" do
    #   it "it returns nil" do
    #     new_encryption = EnigmaEncrpt.new("fake_file", "fake_file")
    #     # new_encryption.should_receive(:warn).with("Some Message")
    #     # expect (new_encryption.file_to_encrypt).to warn("Something is wrong")
    #   end
    # end
  end

  # describe "#test_write" do
  #   it "should write encrypted text to file" do
  #     expect(@encrypt.test_write).to output("Something").to_stdout
  #   end
  # end

end
