def beer_on_the_wall(n)
  return puts 'no more bottles of beer on the wall' if n.zero?

  puts "#{n} bottles of beer on the wall"
  beer_on_the_wall(n - 1)
end
