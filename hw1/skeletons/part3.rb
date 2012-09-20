def combine_anagrams(words)
  srt = words.collect {|wrd| wrd.downcase.chars.sort.join}
  anag = []
  srt.each do |wrd|
    if wrd  != ""
      arr = []
      cnt = srt.count(wrd)
      until cnt == 0
        i = srt.index(wrd)
        arr.push(words[i])
        srt[i] = ""
        cnt = cnt - 1
      end
      anag.push(arr)
    end
  end
  anag
end
