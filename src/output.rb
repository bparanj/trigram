class Output
  LIMIT = 100

  def self.display(results)
    results.take(LIMIT).each do |key, value|
      printf("%-40s | %d", key, value)
      puts "\n"
    end
  end
end
