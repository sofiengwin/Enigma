require "spec_helper"
describe ENIGMATICCLEAN::CleanKey do
  subject { ENIGMATICCLEAN::CleanKey.new("nd..", "020316", "encrypted.txt")}

  describe "#new" do
    it {expect(subject).to be_an_instance_of ENIGMATICCLEAN::CleanKey}
  end

  describe "#clean_key" do
    it "it should return the correct key as a string" do
      expect(subject.clean_key).to eql "21863"
    end
  end
end
