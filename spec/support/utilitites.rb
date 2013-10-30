# Generates a random number of a fixed length. This is useful in generating 
# unique phone extensions.
# 
# EXAMPLE: fixed_length_random(5) should give outputs such as 11111, 28492, 
# 473638, etc.
def fixed_length_random(length)
  if length == 0
    return nil
  else
    max = ("9" * length).to_i
    return (rand(max).to_s.center(length, rand(9).to_s))
  end
end