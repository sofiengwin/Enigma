require "spec_helper"

describe Decryption do
  subject { Decryption.new("./spec/enigma/test_files/test_decrypt.txt",
    "./spec/enigma/test_files/test.txt", "68214", "040316") }
  describe "#decrypt" do
    it "can decrypt any string" do
      expect(subject.decrypt("test")).to eql "u55 "
    end
  end

  describe "#decrypt_write" do
    it "should write decrypted text to file" do
      allow(subject).to receive(:decrypt) { "success" }
      expect(subject.decrypt_write).to eql 7
    end
  end

  describe "#file_to_decript" do
    it "should return string to decrypt" do
      expect(subject.file_to_decript).to eql "mzuid)qyoah%3771681361+)tsx,)"
    end
  end
end
