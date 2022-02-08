def palindrome(string)
  return true if string.length <= 1

  string[0] == string[-1] ? palindrome(string[1..-2]) : false
end
