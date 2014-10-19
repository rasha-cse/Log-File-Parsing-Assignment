
File.foreach("/home/rehan.rasha/Desktop/introduction/rasha.txt").with_index do |line, index|
#puts "#{index}: " 
if line =~ /PROFILER/ && /\/ma\/logbook\/view/ && /(time=)(\d{1,})(ms)/
  #hour="#$1".to_i*10 + "#$2".to_i
  puts "#$2".to_i
end
end