require "minitest/autorun"
require_relative "../src/output"

describe Output do
  describe "When the input has trigrams" do 
    it "prints the output sorted by frequency" do
      input = [["one two three", 4],
                ["five four three", 4],
                ["two three four", 3],
                ["four three two", 3],
                ["three four five", 2],
                ["three two one", 2],
                ["four five six", 1],
                ["five six seven", 1],
                ["six seven eight", 1],
                ["seven eight nine", 1]]

      expected = "one two three                            | 4
five four three                          | 4
two three four                           | 3
four three two                           | 3
three four five                          | 2
three two one                            | 2
four five six                            | 1
five six seven                           | 1
six seven eight                          | 1
seven eight nine                         | 1
"
      out, _ = capture_io do
        Output.display(input)
      end

      assert_equal expected, out
    end
  end

  describe "When the input is empty array" do 
    it "generates no content in the output" do 
      input = []
      expected = ''

      out, _ = capture_io do
        Output.display(input)
      end

      assert_equal expected, out
    end
  end
end
