NORMALIZER_DIGIT = 1
FIRST_UPCASE_LETTER = 65
LAST_UPCASE_LETTER = 90
FIRST_DOWNCASE_LETTER = 97
LAST_DOWNCASE_LETTER = 122

def cipher(text, jumps)
  ciphered = ''
  text
    .split(//)
    .map do |letter|
      letter_shifted = letter.ord
      if upcase_alphabetical_char?(letter_shifted)
        letter_shifted = shift_char(letter.ord, FIRST_UPCASE_LETTER, LAST_UPCASE_LETTER, jumps)
      elsif downcase_alphabetical_char?(letter_shifted)
        letter_shifted = shift_char(letter.ord, FIRST_DOWNCASE_LETTER, LAST_DOWNCASE_LETTER, jumps)
      end
      letter_shifted
    end
    .each { |ascii| ciphered << ascii.chr }
  ciphered.force_encoding('UTF-8')
end

def decipher(text, right_shift_jump)
  deciphered = ''
  text
    .split(//)
    .map do |letter|
      letter_unshifted = letter.ord
      if upcase_alphabetical_char?(letter_unshifted)
        letter_unshifted = unshift_char(letter.ord, FIRST_UPCASE_LETTER, LAST_UPCASE_LETTER, right_shift_jump)
      elsif downcase_alphabetical_char?(letter_unshifted)
        letter_unshifted = unshift_char(letter.ord, FIRST_DOWNCASE_LETTER, LAST_DOWNCASE_LETTER, right_shift_jump)
      end
      letter_unshifted
    end
    .each { |ascii| deciphered << ascii.chr }
  deciphered.force_encoding('UTF-8')
end

def upcase_alphabetical_char?(char)
  char.ord.between?(65, 90)
end

def downcase_alphabetical_char?(char)
  char.ord.between?(97, 122)
end

def shift_char(char, first_char, last_char, jumps)
  char_shifted = char + jumps
  if char_shifted > last_char
    difference = char_shifted - last_char
    char_shifted = first_char + normalize_difference(difference)
  end
  char_shifted
end

def unshift_char(char, first_char, last_char, jumps)
  char_unshifted = char.ord - jumps
  if char_unshifted < first_char
    difference = first_char - char_unshifted
    char_unshifted = last_char - normalize_difference(difference)
  end
  char_unshifted
end

def normalize_difference(difference)
  (difference - NORMALIZER_DIGIT)
end