# m,n = gets.strip.split(' ')
# m = m.to_i
# n = n.to_i
# magazine = gets.strip
magazine = "apgo clm w lxkvg mwz elo bg elo lxkvg elo apgo apgo w elo bg"
magazine = magazine.split(' ')
# ransom = gets.strip
ransom = "elo lxkvg bg mwz clm w"
ransom = ransom.split(' ')
m = 15; n = 6
if m < n
  p 'No'
else
  ransom.each_with_index do |word,i|
    unless magazine.include?(word)
      p 'No'
      break
    else
      magazine.delete_at(magazine.index(word))
    end

    p 'Yes' if i == ransom.size - 1
  end
end
