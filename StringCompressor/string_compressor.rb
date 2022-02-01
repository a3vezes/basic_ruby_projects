class StringCompressor
  def compress(string)
    result = ''
    string.scan(/(.)\1{1,8}/) { result << Regexp.last_match(0).length.to_s + Regexp.last_match(0)[0] }
    result
  end
end
