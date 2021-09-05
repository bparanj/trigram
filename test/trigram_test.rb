require "minitest/autorun"
require_relative "../src/trigram"

describe Trigram do
  describe "When the input is empty string" do 
   it "returns empty list" do 
      input = ''
       
      trigram = Trigram.new(input)
      result = trigram.generate

      _(result).must_be_empty
    end
  end

  describe "When the input has no trigram" do 
    it "returns empty list" do 
      input = 'one two'
       
      trigram = Trigram.new(input)
      result = trigram.generate

      _(result).must_be_empty
    end
  end

  describe "When the input has a trigram" do 
    it "returns a trigram with its frequency" do 
       input = 'one two three'
       
       trigram = Trigram.new(input)
       result = trigram.generate

       expected = [["one two three", 1]]

        _(result).must_equal expected 
    end
  end

  describe "When the input is a String object" do
    it "returns the trigrams sorted by frequency" do
       input = "one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen fifteen fourteen thirteen twelve eleven ten nine eight seven six five four three two one  one  one two  one two three one two three four one two three four five five four three two one five four three two five four three  five four five"

       trigram = Trigram.new(input)
       result = trigram.generate

       expected = [["one two three", 4], 
                   ["five four three", 4], 
                   ["two three four", 3], 
                   ["four three two", 3], 
                   ["three four five", 2], 
                   ["three two one", 2], 
                   ["four five six", 1], 
                   ["five six seven", 1], 
                   ["six seven eight", 1], 
                   ["seven eight nine", 1], 
                   ["eight nine ten", 1], 
                   ["nine ten eleven", 1], 
                   ["ten eleven twelve", 1], 
                   ["eleven twelve thirteen", 1], 
                   ["twelve thirteen fourteen", 1], 
                   ["thirteen fourteen fifteen", 1], 
                   ["fourteen fifteen fifteen", 1], 
                   ["fifteen fifteen fourteen", 1], 
                   ["fifteen fourteen thirteen", 1], 
                   ["fourteen thirteen twelve", 1], 
                   ["thirteen twelve eleven", 1], 
                   ["twelve eleven ten", 1], 
                   ["eleven ten nine", 1], 
                   ["ten nine eight", 1], 
                   ["nine eight seven", 1], 
                   ["eight seven six", 1], 
                   ["seven six five", 1], 
                   ["six five four", 1], 
                   ["two one one", 1], 
                   ["one one one", 1], 
                   ["one one two", 1], 
                   ["one two one", 1], 
                   ["two one two", 1], 
                   ["two three one", 1], 
                   ["three one two", 1], 
                   ["three four one", 1], 
                   ["four one two", 1], 
                   ["four five five", 1], 
                   ["five five four", 1], 
                   ["two one five", 1], 
                   ["one five four", 1], 
                   ["three two five", 1], 
                   ["two five four", 1], 
                   ["four three five", 1], 
                   ["three five four", 1], 
                   ["five four five", 1]]

       _(result).must_equal expected
    end
  end
end