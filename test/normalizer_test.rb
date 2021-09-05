require "minitest/autorun"
require_relative "../src/normalizer"

describe Normalizer do

  describe "The input with two paragraphs" do
    it "should remove new line and return words" do
       input = "\"The Whale is harpooned to be sure; but bethink you, how you would " + 
               "manage a powerful unbroken colt, with the mere appliance of a rope tied " + 
               "to the root of his tail.\" --A CHAPTER ON WHALING IN RIBS AND TRUCKS. " + 
               "\n" + 
               "\"On one occasion I saw two of these monsters (whales) probably male and " + 
               "female, slowly swimming, one after the other, within less than a stone's " + 
               "throw of the shore\" (Terra Del Fuego), \"over which the beech tree " + 
               "extended its branches.\" --DARWIN'S VOYAGE OF A NATURALIST."
        expected = "The Whale is harpooned to be sure but bethink you how you would " + 
                "manage a powerful unbroken colt with the mere appliance of a rope tied " + 
                "to the root of his tail A CHAPTER ON WHALING IN RIBS AND TRUCKS " +  
                "On one occasion I saw two of these monsters whales probably male and " + 
                "female slowly swimming one after the other within less than a stone's " + 
                "throw of the shore Terra Del Fuego over which the beech tree " + 
                "extended its branches DARWIN'S VOYAGE OF A NATURALIST"
      
      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with sentence puntuation" do
    it "should remove punctuation and return words" do
      input = "\"'Stern all!' exclaimed the mate, as upon turning his head, he saw the " + 
              "distended jaws of a large Sperm Whale close to the head of the boat, " + 
              "threatening it with instant destruction;--'Stern all, for your lives!'\" " + 
              "--WHARTON THE WHALE KILLER."
      expected = "Stern all exclaimed the mate as upon turning his head he saw the " + 
                "distended jaws of a large Sperm Whale close to the head of the boat " + 
                "threatening it with instant destruction Stern all for your lives " + 
                "WHARTON THE WHALE KILLER"

      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with asterisks" do
    it "should remove asterisks and return words" do 
      input = "*** START OF THIS PROJECT GUTENBERG EBOOK MOBY DICK; OR THE WHALE ***"
      expected = "START OF THIS PROJECT GUTENBERG EBOOK MOBY DICK OR THE WHALE"

      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with semicolons" do
    it "should remove semicolons and return words" do
      input = "But even assuming all this to be true; " + 
              "yet, were it not for the whiteness, you would not have that intensified " + 
              "terror."

      expected = "But even assuming all this to be true " + 
                "yet were it not for the whiteness you would not have that intensified " + 
                "terror"

       result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with double quotes" do
    it "should remove double quotes and return words" do
      input = "The Romish " + 
              "mass for the dead begins with \"Requiem eternam\" (eternal rest), whence " + 
              "REQUIEM denominating the mass itself, and any other funeral music."
      expected = "The Romish " + 
                "mass for the dead begins with Requiem eternam eternal rest whence " + 
                "REQUIEM denominating the mass itself and any other funeral music"

      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with single quotes" do
    it "should preserve contraction words" do
      input = "He piled upon " + 
              "the whale's white hump the sum of all the general rage and hate felt " + 
              "by his whole race from Adam down; and then, as if his chest had been a " + 
              "mortar, he burst his hot heart's shell upon it."
      expected = "He piled upon " + 
                "the whale's white hump the sum of all the general rage and hate felt " + 
                "by his whole race from Adam down and then as if his chest had been a " + 
                "mortar he burst his hot heart's shell upon it"

      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The word with double hypen" do
    it "should return two words" do
      input = "But it may possibly be conceived that, in the internal parts of the " + 
              "whale, in his anatomy--there, at least, we shall be able to hit the " + 
              "right classification."
      expected = "But it may possibly be conceived that in the internal parts of the " + 
                "whale in his anatomy there at least we shall be able to hit the " + 
                "right classification"

       result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The input with single hypen" do
    it 'should return one word' do
      input = "In various sorts of whales, they form such " + 
              "irregular combinations; or, in the case of any one of them detached, " + 
              "such an irregular isolation; as utterly to defy all general " + 
              "methodization formed upon such a basis. On this rock every one of the " + 
              "whale-naturalists has split."
      expected = "In various sorts of whales they form such " + 
              "irregular combinations or in the case of any one of them detached " + 
              "such an irregular isolation as utterly to defy all general " + 
              "methodization formed upon such a basis On this rock every one of the " + 
              "whale-naturalists has split"

      result = Normalizer.normalize(input)

      _(result).must_equal expected.downcase
    end
  end

  describe "The empty string" do
    it "should return empty string" do
      input = ''
      expected = ''

      result = Normalizer.normalize(input)

      _(result).must_equal expected
    end
  end


  describe "The single word" do
    it "should return single word" do
      input = 'test'
      expected = 'test'

      result = Normalizer.normalize(input)

      _(result).must_equal expected
    end
  end

  describe "The single word with single quote" do
    it "should return single with single quote word" do
      input = "codi'ng"
      expected = "codi'ng"

      result = Normalizer.normalize(input)

      _(result).must_equal expected
    end
  end
end
