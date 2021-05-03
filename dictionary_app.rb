require "http"

system "clear"
puts "Welcome to the dictionary app!"
puts "Please enter a word:"
# word = gets.chomp
word = "shark"

until word == "quit"
  p

  get_definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=zoykch8rrpuv19tuv0o2igg7ketsgrcz213sank54les4zjfv")

  definition_data = get_definition.parse
  definition = definition_data[0]["text"]

  puts "Word: #{word}"
  puts "Definition: #{definition}"

  get_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=zoykch8rrpuv19tuv0o2igg7ketsgrcz213sank54les4zjfv")

  example_data = get_example.parse
  example = example_data["text"]

  puts "Example usage: #{example}"

  get_pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=zoykch8rrpuv19tuv0o2igg7ketsgrcz213sank54les4zjfv")

  pronunciation_data = get_pronunciation.parse
  pronunciation = pronunciation_data[0]["raw"]

  puts "Pronunciation: #{pronunciation}"

  get_audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=zoykch8rrpuv19tuv0o2igg7ketsgrcz213sank54les4zjfv")
  audio_data = get_audio.parse
  audio = audio_data[0]["fileUrl"]
  system("open", audio)

  p

  puts "Please enter another word that you would like to look up, or enter 'quit' if you would like to quit the program."
  word = gets.chomp
end