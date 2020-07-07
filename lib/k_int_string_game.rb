# return a substring k so k-1 dsitinct chars are in the string. only 1 character repeated.

def subStringsLessKDist(inputString, num)
  # return list of possible substrings that
  # k-1 dsitinct chars
  # exactly one repeated char
  # 0<k<26
  # string is only lowercase alphanumeric
  # note: no restriction on input string size...

  # all combinations of desired length
  # comb = inputString.chars.combination(num)
  # TODO could be more eficient without having to filter at end
  comb = (0..inputString.length).map { |i| inputString[i..i + num - 1] }.select { |x| x.length == num }.map(&:chars)	# find combinations with repeated chars

  # map to hash with string and character counts
  counts = comb.map do |combination|
    counts = {}
    combination.each { |char| counts[char] = counts[char] ? counts[char] + 1 : 1 }
    # map to words again using join
    { combination: combination.join, counts: counts }
  end
  # filter to only 1 repeated char
  valid = counts.select { |count| count[:counts].one? { |_key, value| value == 2 } }
  # return
  valid.map { |x| x[:combination] }
  # its not combinations its substrings... so order matters.
end
