#arr = IO.readlines("/home/rehan.rasha/Desktop/introduction/r.log.ms-2.2013-10-21")
#puts arr[0]
#puts arr[3]
puts "Enter the URI:"
URI = gets.chomp
puts "Get or post?[g/p]:"
get_post = gets.chomp
get_post = get_post.upcase
#get_post = ", " + get_post.upcase + ","

while (get_post != "G" && get_post !="P") do
  puts "Wrong keyword!! Please enter again:"
  get_post = gets.chomp
  get_post = get_post.upcase
end

option=", " + get_post.upcase + ","

array_time=[]
array_frequency=[]
for hour  in 1..24
  array_time[hour]=0
  array_frequency[hour]=0
end
File.foreach("/home/rehan.rasha/Desktop/introduction/r.log.ms-2.2013-10-21").with_index do |line, index|
#puts "#{index}: #{line}" if line =~ /PROFILER/ && /\/ma\/logbook\/view/
#puts line.index('time=') if line =~ /PROFILER/ && /\/ma\/logbook\/view/
j=0
total_time=0
#frequency=0
if line =~ /PROFILER/ && /#{URI}/ && /#{option}/ #/\/ma\/logbook\/view/
  
  p=line.index("ms\n")
  q=line.index('time=')+5
  
  #r=line.index(',')
  #hour=(line[r-8].to_i)*10+line[r-7].to_i
  line =~/(\d\d):(\d\d):(\d\d)(..)/
  hour= "#$1".to_i
  line =~ /(time=)(\d{1,})(ms)/
  total_time="#$2".to_i
 # puts hour
=begin
  difference=p-q
  #puts diff
  while j<difference
    total_time += (line[p-j-1].to_i)*(10**j)
    j+=1
  end
=end
  #puts tot 
  #pot+=total
  array_time[hour+1]+=total_time
  array_frequency[hour+1]+=1
  #puts pot
end
end

puts "    Hour Between \t Total Time \t  Frequency"
puts "   --------------\t------------\t -----------"

for hour  in 1..24
  puts "  \t #{hour-1}-#{hour} \t\t #{array_time[hour]} ms \t  #{array_frequency[hour]} times "
end
#puts pot

