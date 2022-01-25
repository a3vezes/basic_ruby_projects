def caesar_cipher(string, step)
  lowercase = ('a'..'z').to_a + ('a'..'z').to_a
  uppercase = ('A'..'Z').to_a + ('A'..'Z').to_a

  result = string.split('').map do |s|
    if lowercase.find_index(s) then
      lowercase[lowercase.find_index(s) + step]
    elsif uppercase.find_index(s) then
      uppercase[uppercase.find_index(s) + step]
    else
      s    
    end
  end
end

puts caesar_cipher("What a string!", -1).inspect
# "Vgzs z rsqhmf!"
puts caesar_cipher("What a string!", 5).inspect
# "Bmfy f xywnsl!"