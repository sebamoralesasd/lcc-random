# frozen_string_literal: true

def read_and_filter_words(file_name, starting_letter)
  File.readlines(file_name).map(&:chomp).select { |word| word.start_with?(starting_letter) }
end

# Lee y filtra las palabras de los archivos
verbs = read_and_filter_words('verbo.txt', 'c')
nouns = read_and_filter_words('diccio.txt', 'c')

# Selecciona aleatoriamente un verbo y un sustantivo
selected_verb = verbs.sample
selected_noun = nouns.sample

# Formatea y devuelve el string
puts "Licenciado en #{selected_verb.capitalize} #{selected_noun.capitalize}"
