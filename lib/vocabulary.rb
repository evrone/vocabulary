require 'httparty'
require "vocabulary/version"

module Vocabulary
  class LookUpError < ::StandardError
    attr_accessor :summary
    def initialize(summary)
      super "Error while parsing Dictionary API response, may be you requested non-existent word. Response: #{summary}"
      @summary = summary
    end
  end
  
  class Word
    attr_accessor :part_of_speech, :meanings
    
    def initialize summary
      begin
        @part_of_speech = summary["primaries"][0]["entries"][0]["labels"][0]["text"]
      
        @meanings = []
        summary["primaries"][0]["entries"][0]["entries"].each do |meaning|
          @meanings << meaning["terms"][0]["text"]
        end
      rescue
        raise Vocabulary::LookUpError.new(summary)
      end
    end
  end
  
  class Dictionary
    include HTTParty
    format :plain
    base_uri 'http://www.google.com/'
    
    def get(word, source_lang, target_lang)
      # example request
      # /dictionary/json?callback=substr&q=apple&sl=en&tl=en&restrict=pr%2Cde&client=te
      options = {}
      options[:query] = {
        :callback => "substr",
        :q => word,
        :sl => target_lang, # source lang
        :tl => source_lang # target lang
      }
      
      response = self.class.get("/dictionary/json", options)
      if response
        info = response.parsed_response
        json = info.gsub("substr(", "").gsub!(",200,null)", "")
        JSON.parse(json)
      end
    end
  end
  
  def self.lookup(word, source_lang, target_lang = nil)
    target_lang ||= :en
    raise ArgumentError, "Word can't be blank" unless word.present?
    data = Vocabulary::Dictionary.new.get(word, source_lang.to_s, target_lang.to_s)
    Vocabulary::Word.new(data)
  end
end
