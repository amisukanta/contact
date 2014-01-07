class ThreadFrokComparison

attr_accessor :num_forks
attr_accessor :num_threads
attr_accessor :cycles

def time_forks(num_forks)
  beginning = Time.now
  num_forks.times do
    fork do
      yield
    end
  end
 
  Process.waitall
  return Time.now - beginning
end
 
def time_threads(num_threads)
  beginning = Time.now
  num_threads.times do
    Thread.new do
      yield
    end
  end
 
  Thread.list.each do |t|
    t.join if t != Thread.current
  end
  return Time.now - beginning
end
 
def calculate(cycles)
  x = 0
  cycles.times do
    x += 1
  end
end
 

end