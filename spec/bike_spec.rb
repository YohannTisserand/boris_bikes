require 'bike'

describe Bike do
  subject (:bike) { Bike.new }
  it { is_expected.to respond_to(:working?) }

  context '#broken' do
    it 'can report broken bikes' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

  context '#working?' do
    it 'allow a bike to work' do
      expect(bike).to be_working
    end
  end
end
