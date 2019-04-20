def bouncingBall(height, bounce, window)
  total_bounces = 1

  if valid_height?(height) &&
     valid_bounce?(bounce) &&
     valid_window?(height, window)

    loop do
      height *= bounce
      break if height < window

      total_bounces += 2
    end

    total_bounces
  else
    -1
  end
end

def valid_window?(height, window)
  window < height
end

def valid_height?(height)
  height > 0
end

def valid_bounce?(bounce)
  (0.01..0.99).cover?(bounce)
end

puts bouncingBall(3, 0.66, 1.5)
puts bouncingBall(30, 0.66, 1.5)
puts bouncingBall(30, 0.75, 1.5)
puts bouncingBall(30, 0.4, 10)
puts bouncingBall(40, 1, 10)
puts bouncingBall(-5, 0.66, 1.5)
