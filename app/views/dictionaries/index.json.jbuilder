json.array!(@dictionaries) do |dictionary|
  json.main_word    dictionary.main_word
  json.pronounce    dictionary.pronounce
  json.type         dictionary.type
  json.meaning    dictionary.meaning
  json.example  dictionary.example
end