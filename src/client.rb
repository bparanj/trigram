require_relative './output'
require_relative './normalizer'
require_relative './trigram'

def generate(words)
  starting = Time.now

  input = words.join(' ')

  input = Normalizer.normalize(input)
  trigram = Trigram.new(input)
  result = trigram.generate

  Output.display(result)

  ending = Time.now
  elapsed = ending - starting

  puts "-" * 50
  puts "It took: #{elapsed} seconds to process"
  puts "-" * 50
end

if ARGV.empty?
  words = ARGF.read.downcase.scan(/[a-z]+/)
  generate(words)
else
  for file in ARGV
    words = File.read(file).downcase.scan(/[a-z]+/)
    generate(words)
  end
end