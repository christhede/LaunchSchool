# - create a program that takes 1 - 2 args. that will determine how many bottles are on the wall
# - after the bottle has been take down from the wall, the current number is subracted by 1.
# - continue the song with that current_number until either current_number reaches 0, or the second arg.
# - two different methods, verse, which takes one arg, and verses wich can take two
# - 


class BeerSong

  def verse(current_verse)

    @current_verse = current_verse
    @next_verse = @current_verse - 1
    
    if @next_verse == 1
      "#{@current_verse} bottles of beer on the wall, #{@current_verse} bottles of beer.\n" +
      "Take one down and pass it around, #{@next_verse} bottle of beer on the wall.\n"
    elsif @next_verse == 0
      "#{@current_verse} bottle of beer on the wall, #{@current_verse} bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif @current_verse == 0 
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{@current_verse} bottles of beer on the wall, #{@current_verse} bottles of beer.\n" +
      "Take one down and pass it around, #{@next_verse} bottles of beer on the wall.\n"
    end
  end

  def verses(current_verse, last_verse)
    current_verse.downto(last_verse).to_a.map { |current_verse| verse(current_verse) }.join("\n")
  end
end


expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
      "\n" \
      "98 bottles of beer on the wall, 98 bottles of beer.\n" \
      "Take one down and pass it around, 97 bottles of beer on the wall.\n"
# p expected
p BeerSong.new.verses(99, 95)
# p BeerSong.new.verse(0)
