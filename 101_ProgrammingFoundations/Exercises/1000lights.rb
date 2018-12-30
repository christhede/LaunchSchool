def on_off_loop(lightbulbs, n)
  index = 2
  until index == n
    lightbulbs.each_index do |x|
      if ((x + 1) % index).zero?
        lightbulbs.at(x) == 'on' ? lightbulbs[x] = 'off' : lightbulbs[x] = 'on'
      else
        x
      end
    end

    index += 1
  end
end

def one_thousand_lights(n)
  lightbulbs = []

  0.upto(n - 1) do |x|
    lightbulbs << x
  end

  lightbulbs.each do |x|
    lightbulbs[x] = 'on'
  end

  on_off_loop(lightbulbs, n)

  result = lightbulbs.each_index.select { |x| lightbulbs[x] == 'on' }

  result = result.map { |x| x + 1 }

  p result
end

one_thousand_lights(25)
