require "spec_helper"

describe EnigmaEncrpt do

    subject { EnigmaEncrpt.new("test.txt", "encrypted.txt") }


  describe "#new" do
    it "should create a new instance" do
      expect(subject).to be_an_instance_of EnigmaEncrpt
    end
  end

  describe "#start_encryption" do
    it "should return a different text than the one given" do
      expect(subject.start_encryption).not_to eql "hello world"
    end
  end

  describe "#encrypt_write" do
    it "should write encrypted text to file" do
      expect(@encrypt.encrypt_write).to eql "hello world"
    end
  end
  
  describe "#file_to_encrypt" do
    context "it returns a string with the correct argument" do
      it "should return a string from the file given" do
        expect(subject.file_to_encrypt).to eql "hello worldnd.."
      end
    end
    context "it exits the system if no argument is given" do
      it "it returns nil" do
        new_encryption = EnigmaEncrpt.new("fake_file", "fake_file")
        expect (new_encryption.file_to_encrypt).to raise_error SystemExit
      end
    end
  end


end
