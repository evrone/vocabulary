# Vocabulary

Wrapper for unofficial Google Dictionary API. *Fetch meanings and part of speech of `any` word of any language.*
You can find the list of supported languages (over 90) in [separated file](https://github.com/kirs/vocabulary/blob/master/languages.md)

##Setup

Run `gem install vocabularry` or

Just add to your Gemfile:

    gem "vocabularry"

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

##Author

- [Kir Shatrov](https://github.com/kirs/) (Evrone Company)

##Feel free for pull requests!