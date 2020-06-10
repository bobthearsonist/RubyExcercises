# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0

  digits = x.to_s.chars
  digits.reverse.zip(digits).each_with_index do |each, index|
    return false if each[0] != each[1]
    return true if index >= digits.length / 2
  end
end
