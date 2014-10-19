#arr = IO.readlines("/home/rehan.rasha/Desktop/introduction/rasha.txt")
#puts arr[0]
#puts arr[3]
puts "Enter the URI:"
URI = gets.chomp
puts "Get or post?:"
get_post = gets.chomp

opt=", " + get_post.upcase + ","
puts opt
$array=[]
#$array_post=[]
def array_initialize
  for hour in 1..24
    $array[hour]=0
#    $array_post[hour]=0
  end
 # return $array
end
#array_initialize
def logfile_parsing#(array)
  File.foreach("/home/rehan.rasha/Desktop/introduction/rasha.txt").with_index do |line, index|
#puts "#{index}: #{line}" if line =~ /PROFILER/ && /\/ma\/logbook\/view/
#puts line.index('time=') if line =~ /PROFILER/ && /\/ma\/logbook\/view/
  j=0
  total_time=0
  if line =~ /PROFILER/ && /#{URI}/ && /#{opt}/ #/\/ma\/logbook\/view/
    p=line.index("ms\n")
    q=line.index('time=')+5
  
    r=line.index(',')
    hour=(line[r-8].to_i)*10+line[r-7].to_i
  
  #puts hour
    difference=p-q
  #puts diff
    while j<difference
      total_time += (line[p-j-1].to_i)*(10**j)
      j+=1
    end
  #puts tot 
  #pot+=total
   $array[hour+1]+=total_time
  #puts pot
  end
  end
  #return array
end

def show_result#(array)
  for hour  in 1..24
    puts "Hour between #{hour-1}-#{hour} :#{$array[hour/1000.0]}s  "
  end
end

array_initialize
logfile_parsing#(array_initialize)
show_result#(logfile_parsing(array_initialize))
#puts pot

