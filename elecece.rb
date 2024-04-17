# frozen_string_literal: true

class Elecece
  def generate
    # Lee y filtra las palabras de los archivos
    verbs = read_and_filter_words('./data/verbo.txt', 'c')
    nouns = read_and_filter_words('./data/diccio.txt', 'c')

    # Selecciona aleatoriamente un verbo y un sustantivo
    selected_verb = verbs.sample
    selected_noun = nouns.sample

    # Formatea y devuelve el string
    pair = "#{selected_verb.capitalize} #{selected_noun.capitalize}"
    long_version = "Licenciado en #{pair}"
    return long_version unless long_version.length > 32

    short_version = "Lic. en #{pair}"
    return short_version unless short_version.length > 32

    generate
  end

  private

  def read_and_filter_words(file_name, starting_letter)
    File.readlines(file_name).map(&:chomp).select { |word| word.start_with?(starting_letter) }
  end
end
