require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }

  context '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'release working bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

    it 'releases the bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when docking station is empty' do
      expect { subject.release_bike }.to raise_error 'No bike available'
    end
  end

  context '#dock' do
    it 'docks bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'should return docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq [bike]
    end

    it 'should raise an error when storage is full' do
      20.times { subject.dock Bike.new }
      expect{ subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
