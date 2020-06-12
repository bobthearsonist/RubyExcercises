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

def is_palindrome_almost_cheating(x)
  return false if x < 0

  x.digits == x.digits.reverse ? true : false
end

def is_palindrome_array(x)
  return false if x < 0

  digits = x.to_s.chars
  half = digits.length / 2
  i = 0
  j = digits.length - 1
  until i >= half
    return false if digits[i] != digits[j]

    i += 1
    j -= 1
  end
  true
end

# dont really like this one, its the offered solution...
def is_palindrome_modulo(x)
  return false if x < 0 || (x % 10 == 0 && x != 0)

  reverse = 0;
  while x > reverse
    reverse = reverse*10 + x%10
    x/=10
  end

  return x == reverse || x == reverse/10
end
