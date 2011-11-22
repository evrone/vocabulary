# Vocabulary

Wrapper for unofficial Google Disctionary API. Fetch part of speech and meanings of `any` word of any language.
You can find list of supported languages (over 90 in separate file)

##Usage

Examples:

  word = Vocabulary::lookup("kaunis", :fi)
  word.part_of_speech
   => "adjective" 
  word.meanings
   => ["beautiful", "lovely", "pretty", "handsome", "fine", "nice", "fair"] 
   
  word = Vocabulary::lookup("яблоко", :ru)
  word.part_of_speech
   => "noun"
  word.meanings
   => ["apple"]
   
You can fetch meanings in any language:

  word = Vocabulary::lookup("apple", :en, :ru)
  word.part_of_speech
   => "noun"
  word.meanings
   => ["яблоко", "яблоня", "лесть", "чепуха"]

##Todo

- Add RSpec tests

##Authors

- [Kir Shatrov](https://github.com/kirs/) (Evrone Company)

##Feel free for pull requests!