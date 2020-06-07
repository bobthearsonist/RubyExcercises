# Given a collection of numbers that might contain duplicates, return all possible unique permutations.
class Permutations2
  def self.standard_lib(nums)
    nums.permutation.uniq
  end

  def self.shifting(nums)
    take = nums.dup
    working = nums.dup
    solution = Set.new
    nums.length.times do |_index|
      solution << working.dup
      working.pop
      working.unshift(take.pop)
    end
    solution.to_a
  end
end
