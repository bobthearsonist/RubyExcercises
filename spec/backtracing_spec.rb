require 'logging'
require 'backtracing'

# left as a reference for later when debuggin recursion
RubyVM::InstructionSequence.compile_option = {
  # tailcall_optimization: true,
  # trace_instruction: false
}
# can also add the following to the .env file
# export RUBY_THREAD_VM_STACK_SIZE=500000000

include Logging # rubocop:disable Style/MixinUsage:
# seeting to DEBUG will enable output of the board each modification (recurse or remove)
logger.level = Logger::WARN

describe KnightsTour do
  after(:example) do
    print @board.to_s
  end
  it 'solves the simplest solvable board' do
    expect(KnightsTour.new(1).backtracking_tour.solved).to be_truthy
  end
  it 'cannot solve unsolvable boards', :aggregate_failures do
    expect(KnightsTour.new(2).backtracking_tour.solved).to be_falsy
    expect(KnightsTour.new(3).backtracking_tour.solved).to be_falsy
    expect(KnightsTour.new(4).backtracking_tour.solved).to be_falsy
  end
  it 'cannot solve from any start position on an unsolvable even board', :aggregate_failures do
    (0..2).each { |x| (0..1).each { |y| expect(KnightsTour.new(2, Position.new(x, y)).backtracking_tour.solved).to be_falsy } }
  end
  it 'cannot solve from any start position on an unsolvable odd board', :aggregate_failures do
    (0..2).each { |x| (0..2).each { |y| expect(KnightsTour.new(3, Position.new(x, y)).backtracking_tour.solved).to be_falsy } }
  end
  it 'should work from every corner for a solvable board', :aggregate_failures do
    expect(@board = KnightsTour.new(6, Position.new(0, 0)).backtracking_tour.solved).to be_truthy
    expect(@board = KnightsTour.new(6, Position.new(5, 5)).backtracking_tour.solved).to be_truthy
    expect(@board = KnightsTour.new(6, Position.new(0, 5)).backtracking_tour.solved).to be_truthy
    expect(@board = KnightsTour.new(6, Position.new(5, 0)).backtracking_tour.solved).to be_truthy
  end
end
