class Trigram
  SEQUENCE_SIZE = 3

  def initialize(input)
    @input = input
  end

  def generate
    elements = word_sequence
    sort(count(elements))
  end

  private

  def word_sequence
    @input.split.each_cons(SEQUENCE_SIZE).map do |element|
      element.join(' ')
    end
  end

  def count(elements)
    hash = Hash.new(0)

    elements.each do |element|
      hash[element] += 1
    end

    hash
  end

  def sort(hash)
    hash.sort_by {|k, v| -v }
  end
end
