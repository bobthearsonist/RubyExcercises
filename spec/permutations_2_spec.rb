require 'permutations_2'

test_cases = [
  { input: [1, 1, 2],
    expected: [
      [1, 1, 2],
      [1, 2, 1],
      [2, 1, 1]
    ] }
]

describe Permutations2 do
  test_cases.each do |test|
    it "returns #{test[:expected]} when given #{test[:input]}" do
      expect(Permutations2.standard_lib(test[:input])).to match_array(test[:expected])
      expect(Permutations2.shifting(test[:input])).to match_array(test[:expected])
    end
  end
end
