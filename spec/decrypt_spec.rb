require "spec_helper"
describe EnigmaDecrypt do
  subject { EnigmaDecrypt.new("encrypted.txt", "master.txt", "51569", "020316")}
  describe "#new" do
    context "All arguments where provided" do
      it {expect(subject).to be_an_instance_of EnigmaDecrypt}
    end

    context "should show user error if the wrong argument is passed" do
      new_decrypt = EnigmaDecrypt.new("encrypted.txt", "master.txt", "5156", "02031")
      it "it show error message" do
        expect{new_decrypt.decrypt_write}.to raise_error SystemExit
      end
    end
  end

  describe "#file_to_decript" do
    it "it return the file to be decrypted" do
      expect(subject.file_to_decript).to eql ",4ycfz9fi,qe7xk"
    end
  end

  describe "#decript_wite" do
    it "it writes decrypted text to file" do
      allow(STDIN).to receive(:gets).and_return('no')
      expect(subject.decrypt_write).to eql nil
    end
  end

end
