# return a substring k so k-1 dsitinct chars are in the string. only 1 character repeated.

def subStringsLessKDist(inputString, num)
  # return list of possible substrings that
  # k-1 dsitinct chars
  # exactly one repeated char
  # 0<k<26
  # string is only lowercase alphanumeric
  # note: no restriction on input string size...

  # all combinations of desired length
  # TODO could be more eficient without having to filter at end
  comb = (0..inputString.length).map { |i| inputString[i..i + num - 1] }.select { |x| x.length == num }.map(&:chars)

  # map to hash with string and character counts
  comb.filter_map do |combination|
    counts = Hash.new(0)
    combination.each { |char| counts[char] += 1 }
    # map to words again using join, only add if 1 char is repeated twice
    combination.join if counts.one? { |_k, v| v == 2 }
  end
end
