def get_inputs() 
  puts "Caesar Cipher the Statement"
  statement = gets.chomp
  puts "How many shift?"
  shift = gets.chomp.to_i
  caesar_cipher(statement, shift)
end

def caesar_cipher(statement, shift)
  ascii_dec_code = statement.unpack("c*")
  encrypt_code = ascii_dec_code.map do |dec_code|    
    if (dec_code.between?(65,90) || dec_code.between?(97,122)) 
      cipher_dec_code(dec_code, shift)
    else
      dec_code
    end
  end
  puts "Statement encrypted via Caesar Cipher"
  puts encrypt_code.pack("c*")
end

def cipher_dec_code(initial_dec_code, shift)
  shifted_dec_code = initial_dec_code + shift

  if (shifted_dec_code > 122)
    shifted_dec_code = 97 + (shifted_dec_code - 123)
    shifted_dec_code
  elsif(shifted_dec_code > 90 && initial_dec_code < 91 && shift.negative?)
    shifted_dec_code = 122 - (91 - shifted_dec_code)
    shifted_dec_code
  elsif (shifted_dec_code > 90 && initial_dec_code < 91)
    shifted_dec_code = 65 + (shifted_dec_code - 91)
    shifted_dec_code
  elsif(shifted_dec_code < 65)
    shifted_dec_code = 90 - (64 - shifted_dec_code)
    shifted_dec_code
  elsif (shifted_dec_code < 97 && initial_dec_code > 96)
    shifted_dec_code = 122 -  (96 - shifted_dec_code)
    shifted_dec_code
  else 
    shifted_dec_code
  end
end

get_inputs()