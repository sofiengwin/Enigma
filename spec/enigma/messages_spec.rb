require "spec_helper"
describe Messages do
  subject { Messages.new }
  it { expect(subject.argument_error).to be_a String }
  it { expect(subject.file_type_error).to be_a String }
  it { expect(subject.file_not_present).to be_a String }
  it { expect(subject.overwrite_file).to be_a String }
  it { expect(subject.success_message("master.txt", "51569", "030316")).to be_a String }
end
