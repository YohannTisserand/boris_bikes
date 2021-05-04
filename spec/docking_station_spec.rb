require 'docking_station'

describe DockingStation do
  let(:bike) { instance_double(Bike, :bike, working?: true) }
  let(:broken_bike) { instance_double(Bike, :broken_bike, working?: false) }
  it { is_expected.to respond_to(:bikes) }

  context '#release_bike' do
    context '#when not empty' do
      before(:example) { subject.dock(bike) }
      let(:released_bike) { subject.release_bike }
      it { is_expected.to respond_to(:release_bike) }

      it 'releases a bike' do
        expect(released_bike).to be bike
      end

      it 'releases a working bike' do
        expect(released_bike).to be_working
      end
    end

    context '#empty' do
      it 'raises error if no bikes are available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    context 'when broken' do
      it 'raises an error if all bikes are broken' do
        subject.dock(broken_bike)
        expect { subject.release_bike }.to raise_error 'No working bike available'
      end
    end
  end

  context '#dock' do
    context 'when not full' do
      it { is_expected.to respond_to(:dock).with(1).argument }

      it 'adds bike to bikes' do
        subject.dock(bike)
        expect(subject.bikes).to include(bike)
      end
    end
    
    context 'when full' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock(bike) }
        expect { subject.dock(bike) }.to raise_error 'Docking station full'
      end
    end
  end
end
