require 'docking_station'
require 'coveralls'
Coveralls.wear!

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
end
