class StringCompressor
  def compress(string)
    string.gsub(/(.)\1{1,8}/) { |s| s.length.to_s + s[0] }
  end
end
