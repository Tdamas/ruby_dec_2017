# Delete

song = {:first => "Happy", :second => "Birthday"}
song.delete(:first)
p song

# empty?

song.delete(:second)
p song.empty?

# has_key?(key)

cats = {:first => "Percy", :second => "Charlie", :third => "Frost", :fourth => "Seamus"}

p cats.has_key?(:fifth)

p cats.has_value?("Charlie")


# has_value?(value)



