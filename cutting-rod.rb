#!/bin/bash/env ruby

def cutrod(prices, rod_size)
  return 0,[] if rod_size.zero?

  q = -Float::MAX.to_i

  wining_combo = []
  (1..rod_size).each do |size|
    #  p[i], cutrod(p, n-i)

    cost_for_remaining, rem_wining_combo =  cutrod(prices, rod_size - size)
    if (prices[size - 1] + cost_for_remaining) > q
      wining_combo = [size, rem_wining_combo].flatten
      q = prices[size - 1] + cost_for_remaining
    end
    #puts "wining_combo: #{wining_combo}"
    #puts "(#{q},#{(prices[size - 1] + cost_for_remaining)}) => (#{size}, #{rod_size-size})"
  end

  return q, wining_combo
end

def cutrod_bottom_up(prices, rod_size)
  r = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0 ,0 ,0, 0,0,0,0,0,0,0,0,0]
  q = -Float::MAX.to_i
  (1..rod_size).each do |size|
    (1..size).each do |lsize|
      q = [q, prices[lsize-1] + r[size-lsize]].max
    end
    r[size] = q
  end
  r
end

prices = [1, 5, 8, 9, 10, 87, 17, 20, 29, 30, 34, 40, 40, 50, 48, 53, 56, 78, 88, 89, 90, 91, 92, 93, 94, 95, 100]

# maximum, combo = cutrod(prices, ARGV[0].to_i)
# puts maximum
# puts "winning comb: #{combo}"

puts "cutrod_bottom_up(prices, rod_size): #{cutrod_bottom_up(prices, ARGV[0].to_i)}"