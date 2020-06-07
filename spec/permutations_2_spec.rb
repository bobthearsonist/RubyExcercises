require 'permutations_2'

test_cases = [
  { input: [1, 1, 2],
    expected: [[1, 1, 2], [1, 2, 1], [2, 1, 1]] },
  { input: [1, 2, 3],
    expected: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]] }
]

describe Permutations2 do
  it('failing algorithm') do
    expect(Permutations2.shifting(test_cases[0][:input])).to match_array(test_cases[0][:expected])
    # expect(Permutations2.shifting(test_cases[1][:input])).to match_array(test_cases[1][:expected])
  end

  test_cases.each do |test|
    it "returns #{test[:expected]} when given #{test[:input]}" do
      expect(Permutations2.standard_lib(test[:input])).to match_array(test[:expected])
    end
  end
end
