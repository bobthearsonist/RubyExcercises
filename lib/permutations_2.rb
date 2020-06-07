# Given a collection of numbers that might contain duplicates, return all possible unique permutations.
class Permutations2
  def self.standard_lib(nums)
    nums.permutation.uniq
  end

  def self.shifting(nums)
    take = nums
    working = nums
    solution = {}
    solution[0] = working
    nums.length.times do |index|
      working.pop
      working.push(take.pop)
      solution[index] = working
    end
    solution.values
  end
end
