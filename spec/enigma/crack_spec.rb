require "spec_helper"
describe EnigmaCrack do
  subject { EnigmaCrack.new("nd..", "020316", "encrypted.txt", "test.txt") }
  describe "#new" do
    it { expect(subject).to be_an_instance_of EnigmaCrack}
  end

  describe "#crack_write" do
    context "The correct arguments were passed" do
      it "it should confirm that it has successful written to file" do
        expect(subject.crack_write).to eql "hello world"
      end
    end

    context "Incorrect number of arguments or incorrect argument format" do
      it "should show user an error message" do
        expect(subject.crack_write).to eql "hello world"
      end
    end
  end

end
