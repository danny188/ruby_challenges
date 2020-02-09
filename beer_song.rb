class BeerSong

  def verses(start, finish = start)
    bottle_nums = (finish..start).to_a.reverse

    bottle_nums.map do |bottle_num|
      verse(bottle_num)
    end.join("\n")
  end

  def verse(bottle_num)
    bottles_text = Array.new(100) {|idx| "#{idx} bottles"}
    bottles_text[1] = "1 bottle"
    bottles_text[0] = "No more bottles"
    actions = Array.new(100, "Take one down and pass it around")
    actions[0] = "Go to the store and buy some more"
    actions[1] = "Take it down and pass it around"

    "#{bottles_text[bottle_num]} of beer on the wall, #{bottles_text[bottle_num].downcase} of beer.\n" \
    "#{actions[bottle_num]}, #{bottles_text.fetch(bottle_num-1,bottles_text[99]).downcase} of beer on the wall.\n"

  end

  def lyrics
    verses(99, 0)
  end
end