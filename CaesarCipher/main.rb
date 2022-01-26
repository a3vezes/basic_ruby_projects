class CaesarCipher
  @@lowercase = ('a'..'z').to_a
  @@uppercase = ('A'..'Z').to_a

  def caesar_cipher(string, step)
    result = string.split('').map do |s|
      if @@lowercase.find_index(s) then
        @@lowercase[(@@lowercase.find_index(s) + step) % 26]
      elsif @@uppercase.find_index(s) then
        @@uppercase[(@@uppercase.find_index(s) + step) % 26]
      else
        s    
      end
    end.join('')
  end
end