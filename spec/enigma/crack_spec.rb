require "spec_helper"
describe ENIGMA::Crack do
  subject { ENIGMA::Crack.new("test_crack.txt", "test_crack_1.txt", "040316") }

  describe "#new" do
    it { expect(subject).to be_an_instance_of ENIGMA::Crack }
  end

  describe "#clean_key" do
    it "it should return the correct key as a string" do
      expect( ENIGMA::Crack.new("test_crack.txt", "test_crack", "020316").clean_key).to eql "68214"
    end
  end

  describe "#file_to_crack" do
    it "should return encrypted text to be cracked" do
      expect(subject.file_to_crack).to eql "gq,5nl2, o.r9qax9j"
    end
  end

  describe "#crack_write" do
    it "it should write decrypted text to file" do
      expect(subject.crack_write).to eql 18
    end
  end
end
