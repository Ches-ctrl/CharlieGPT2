def animate_dots(iterations, delay)
  (1..iterations).each do |i|
    dots = '.' * i
    print "\r#{dots}\r"
    sleep delay
  end
end

# Usage
animate_dots(3, 0.5)  # Display dots 3 times with a delay of 1 second
