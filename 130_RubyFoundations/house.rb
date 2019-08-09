class House
  def self.recite
    new.recite
  end

  def recite
    paragraph = []
    11.downto(0) do |x|
      str = []
      if x == 11
        str << "This is #{pieces[x][0]}.\n"
      else
        str << "This is #{pieces[x][0]}"
      end

      x.upto(10) do |i|
        if i == 10
          str << "#{pieces[i][1]} #{pieces[i+1][0]}.\n"
        else
          str << "#{pieces[i][1]} #{pieces[i+1][0]}"
        end
      end
      paragraph << str.join("\n")
    end
    paragraph.join("\n")
  end
  
  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

house = House
p house.recite