class Normalizer
  def self.normalize(input)
    input.gsub(/\.|\,|\;|\\"'|\(|\)|\*|\!'|\\"|\\n"/,'')
                .gsub(/\--'/, '--' )
                .gsub(/\-{2}/, ' ' ).gsub(/\"'/, '' )
                .gsub(/\"/, '' )
                .gsub(/"\n"/, '' )
                .gsub(/\n/, '' )
                .gsub(/\s+/, ' ' ).downcase.strip
  end
end
