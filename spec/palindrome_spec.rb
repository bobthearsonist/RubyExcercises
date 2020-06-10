require 'palindrome'

describe do
  it 'can find palindromes', :aggregate_failures do
    expect(is_palindrome(0)).to be_truthy
    expect(is_palindrome(11)).to be_truthy
    expect(is_palindrome(101)).to be_truthy
    expect(is_palindrome(1_000_000_001)).to be_truthy
  end

  it 'can find not palindromes', :aggregate_failures do
    expect(is_palindrome(50_001)).to be_falsy
    expect(is_palindrome(122)).to be_falsy
  end

  test_cases = [0, 11, 101, 1_000_000_001]
  describe 'is_palindrome_array can find palindromes', :aggregate_failures do
    test_cases.each do |test|
      it "can analyze #{test}" do
        expect(is_palindrome_array(test)).to be_truthy
      end
    end
  end
  it 'is_palindrome_array can find not palendromes', :aggregate_failures do
    expect(is_palindrome_array(50_001)).to be_falsy
    expect(is_palindrome_array(122)).to be_falsy
  end

  describe 'is_palindrome_modulo can find palendromes', :aggregate_failures
  test_cases.each do |test|
    it "can analyze #{test}" do
      expect(is_palindrome_modulo(test)).to be_truthy
    end
  end

  it 'is_palindrome_modulo can find not palendromes', :aggregate_failures do
    expect(is_palindrome_modulo(50_001)).to be_falsy
    expect(is_palindrome_modulo(122)).to be_falsy
  end

  describe 'is_palindrome_almost_cheating can find palendromes', :aggregate_failures
  test_cases.each do |test|
    it "can analyze #{test}" do
      expect(is_palindrome_almost_cheating(test)).to be_truthy
    end
  end

  it 'is_palindrome_almost_cheating can find not palendromes', :aggregate_failures do
    expect(is_palindrome_almost_cheating(50_001)).to be_falsy
    expect(is_palindrome_almost_cheating(122)).to be_falsy
  end
end
