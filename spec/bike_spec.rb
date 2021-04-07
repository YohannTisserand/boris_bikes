require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  it 'can report broken bikes' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
