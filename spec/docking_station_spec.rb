require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  context '#release_bike' do
    it 'should release working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

  context '#dock' do
    it 'should dock a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq(bike)
    end

    it 'should return docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end
  end
end
