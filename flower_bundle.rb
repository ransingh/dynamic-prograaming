def flower_bundle(bundles, required_flowers)
  
  return 0,[] if required_flowers == 0
  return 1000000000000,[] if required_flowers < 0

  q = 10000
  q_choosen = []
  (1..bundles.size).each do |i|
    choosen = []
    choosen << bundles[i-1]
    remainder, remainder_choosen = flower_bundle(bundles, required_flowers - bundles[i-1])
    if ((1 + remainder) < q )
      q = 1 + remainder
      q_choosen = [choosen, remainder_choosen].flatten      
    end
  end

  return q, q_choosen
end

puts "ARGV: #{ARGV}"
puts flower_bundle(ARGV[0].split(',').map(&:to_i), ARGV[1].to_i)


def flower_bundle_bottom_up(bundles, required_flowers)  
  return 0,[] if required_flowers == 0
  return 1000000000000,[] if required_flowers < 0

  q = 10000
  q_choosen = []
  (1..bundles.size).each do |i|
    (1..i).each do |j|
      
    end  
  end

  return q, q_choosen
end