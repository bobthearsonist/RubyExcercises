require 'backtracing'

describe KnightsTour do
  it 'solves thoe board' do
    expect(KnightsTour.new(4).backtracking_tour.solved).to be_truthy
  end
end
