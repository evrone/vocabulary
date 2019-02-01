# PLEASE NOTE, THIS PROJECT IS NO LONGER BEING MAINTAINED
# Vocabulary

Wrapper for unofficial Google Dictionary API. *Fetch meanings and part of speech of `any` word of any language.*
You can find the list of supported languages (over 90) 
in [separated file](https://github.com/kirs/vocabulary/blob/master/languages.md)


<a href="https://evrone.com/?utm_source=github.com">
  <img src="https://evrone.com/logo/evrone-sponsored-logo.png"
       alt="Sponsored by Evrone" width="231">
</a>

## Getting Started
### Installation

Run `gem install vocabulary` or

Just add to your Gemfile:

    gem "vocabulary"

### Usage

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

## Contributing

Please read [Code of Conduct](CODE-OF-CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md) for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, 
see the [tags on this repository](https://github.com/evrone/vocabulary/tags). 

## Authors

* [Kir Shatrov](https://github.com/kirs/) - *Initial work*

See also the list of [contributors](https://github.com/evrone/vocabulary/contributors) who participated in this project.

## License

This project is licensed under the [MIT License](LICENSE).
