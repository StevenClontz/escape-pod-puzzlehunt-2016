plaintext = <<heredoc
Those stupid Americans will never guess that Byron is one of our codewords!
heredoc

# plaintext = "TWKHY DTJLRD LMTHXCLNB SXLW HTRTR LUTOH NSAI XHRZN XI DNP OO KJR NISALOWDH!"

plaintext.upcase!

index = 0
ciphertext = plaintext.split("").map do |char|
  new_char = char
  if ("A".."Z").include? char
    index = index + 1
  end
  if index % 2 == 0 && ("A".."Z").include?(char)
    new_char = (((new_char.ord - "A".ord - 4) % 26) + "A".ord).chr
  end
  if index % 3 == 0 && ("A".."Z").include?(char)
    new_char = (((new_char.ord - "A".ord - 11) % 26) + "A".ord).chr
  end
  if index % 5 == 0 && ("A".."Z").include?(char)
    new_char = (((new_char.ord - "A".ord - 6) % 26) + "A".ord).chr
  end
  new_char
end.join

puts ciphertext
