puts "Enter the URI : "
URI = gets.chomp
array_get_time=[]
array_post_time=[]
array_get_frequency=[]
array_post_frequency=[]

for hour  in 1..24
  array_get_time[hour]=0
  array_post_time[hour]=0
  array_get_frequency[hour]=0
  array_post_frequency[hour]=0
end
File.foreach("/home/rehan.rasha/Desktop/introduction/r.log.ms-2.2013-10-21").with_index do |line, index|

total_get_time=0
total_post_time=0

if line =~ /PROFILER/ && /#{URI}/ #&& /#{option}/ 
  
  if line=~ /, G,/
  line =~/(\d\d):(\d\d):(\d\d)(..)/
  hour= "#$1".to_i
  line =~ /(time=)(\d{1,})(ms)/
  total_get_time="#$2".to_i
 
  array_get_time[hour+1]+=total_get_time
  array_get_frequency[hour+1]+=1
  
  elsif line=~ /, P,/
  line =~/(\d\d):(\d\d):(\d\d)(..)/
  hour= "#$1".to_i
  line =~ /(time=)(\d{1,})(ms)/
  total_post_time="#$2".to_i
 
  array_post_time[hour+1]+=total_post_time
  array_post_frequency[hour+1]+=1
  end
  
  
end
end

puts "    Hour Between \t Total Get Time \t  Get Frequency \t Total Post Time \t Post Frequency"
puts "   --------------\t----------------\t ---------------\t----------------\t ---------------"

for hour  in 1..24
  puts "  \t #{hour-1}-#{hour} \t\t #{array_get_time[hour]} ms \t\t  #{array_get_frequency[hour]} times  \t\t #{array_post_time[hour]} ms \t\t  #{array_post_frequency[hour]} times"
end


