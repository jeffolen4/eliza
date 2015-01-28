
module Liza

  class Phrase
    attr_accessor :phrase

    def initialize ( phrase )
      @phrase = phrase
      @responses = []
    end

    # def inspect
    #   puts "Phrase:\t #{@phrase}"
    #   count=1
    #   @responses.each do |response|
    #     puts "Response #{count.to_s}:\t #{response}"
    #     count += 1
    #   end
    # end

    def add_response ( response )
      @responses << response
    end

    def get_response
      return @responses[0] unless @responses.length > 1
      return @responses[ rand(0..@responses.length-1) ]
    end

  end

  class Phrase_list

    attr_accessor :sessionEnd

    def initialize ()
      @phrases = {}
      self.load_phrases;
      @sessionEnd = ""
      # if phrase != ""
      #   @phrases[phrase.downcase] = Phrase.new( phrase.downcase )
      #
      # end
    end

    # def inspect
    #   puts "Session ender:\t #{@sessionEnd}"
    #   @phrases.each{|phrase| phrase.inspect }
    # end

    def add_phrase ( phrase )
      if (phrase != "" && phrase.downcase.split(" ").length.between?(1,3) )
        @phrases[phrase.downcase] = Phrase.new( phrase.downcase )
      end
    end

    def get_phrase ( phrase )
      return @phrases[phrase.downcase]
    end

    def get_response ( phrase )
      # check for blank phrase and return default response
      if phrase == ""
        return @sessionEnd
      end

      words = phrase.downcase.split(" ")
      words.each_with_index do |word, index|

        partial = words[index..(index+2)].join(" ")

        until partial == "" || @phrases.include?(partial) do
          partial_words = partial.split(" ")
          partial_words.pop
          partial = partial_words.join(" ")
        end

        if partial != "" && @phrases.include?(partial)
          return @phrases[partial].get_response
        end

      end

      return @phrases["{default}"].get_response;

    end

    def load_phrases

      self.add_phrase("Hello")
      self.get_phrase("Hello").add_response("Hi. Tell me about your problem.")
      self.get_phrase("Hello").add_response("Let's talk more about you.")

      self.add_phrase("mom")
      self.get_phrase("mom").add_response("What's your earliest memory of your mother?")
      self.get_phrase("mom").add_response("Were you close to your mother?")

      self.add_phrase("mom's funeral")
      self.get_phrase("mom's funeral").add_response("I'm sorry you lost your mother.")
      self.get_phrase("mom's funeral").add_response("When did your mother die?")

      self.add_phrase("cat")
      self.get_phrase("cat").add_response("How many cats do you have?")
      self.get_phrase("cat").add_response("Have you always had cats as pets?")

      self.add_phrase("watching the news")
      self.get_phrase("watching the news").add_response("Does the state of things scare you?")
      self.get_phrase("watching the news").add_response("Don't watch Fox news.")

      self.add_phrase("{default}")
      self.get_phrase("{default}").add_response("Tell me more about that.")
      self.get_phrase("{default}").add_response("That's good. How does that make you feel?")

    end

  end

end
