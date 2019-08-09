class House
  def self.recite
    new.recite
  end

  def recite
    paragraphs = []

    (-1).downto(-pieces.count) do |line_number|
      paragraphs << rhyme_paragraph(get_pieces_for_paragraph(line_number))
    end

    paragraphs.join("\n")
  end

  private

  def rhyme_paragraph(lines)
    text = 'This is'

    lines.each do |line|
      text << " #{line.join("\n")}"
    end

    "#{text}.\n"
  end

  def get_pieces_for_paragraph(starting_line_number)
    pieces[starting_line_number, starting_line_number.abs]
  end

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

house = House.new
p house.recite