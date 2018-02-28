require 'open-uri'

# ENG SUB
# file1 = []
# open("https://s3-us-west-1.amazonaws.com/engsoci/subtitles/Friends.S01E01.DVDrip.XviD-SAiNTS.srt").each_with_index do |line, idx|
#   next if line.include?("-->") || line == "\r\n" || line[/(\d+)(\r?\n)/]
#   file1 << line
# end

# VI SUB

# open("https://s3-us-west-1.amazonaws.com/engsoci/subtitles/Friends.S01E01.mHD.BluRay.DD5.1.x264-EPiK.srt").each_with_index do |line, idx|
#   next if line.include?("-->") || line == "\r\n" || line[/(\d+)(\r?\n)/]
#   # file1 << line
#   p line
# end

# file1.each {|line| p line}


# codes = Encoding.constants
# codes.shift(5)
# line = "\x00C\x00\xAD\x1Eu\x00 \x00l\x00\xE0\x00m\x00 \x00n\x00\xF3\x00 \x00h\x00a\x00y\x00 \x00c\x00h\x00\xC9\x1E \x00l\x00\xE0\x00 \x00p\x00h\x00\xE5\x1Ec\x00 \x00v\x00\xE5\x1E \x00t\x00h\x00\xF4\x00i\x00?\x00\r\x00\n"
# codes.each do |code|
#   begin
#     p line.charset #encode(code.to_s, :invalid => :replace, :undef => :replace, :replace => '')
#   rescue => e
#     p e
#   end
# end

# IO.read("Friends.S01E01.mHD.BluRay.DD5.1.x264-EPiK.srt","t").each do |line|
#   next if line.include?("-->") || line == "\r\n" || line[/(\d+)(\r?\n)/]
#   # file1 << line
#   p line
# end
p IO.read("Doctor.Strange-The.Sorcerer.Supreme[2007]DvDrip.AC3[Eng]-aXXo-vietnamese.srt")