class Phrase
  attr_accessor :phrase

  def initialize ( phrase )
    @phrase = phrase
    @responses = []
  end

  def inspect
    puts "Phrase:\t #{@phrase}"
    count=1
    @responses.each do |response|
      puts "Response #{count.to_s}:\t #{response}"
      count += 1
    end
  end

  def add_response ( response )
    @responses << response
  end

  def get_response
    return @responses[0] unless @responses.length > 1
    return @responses[ rand(0..@responses.length-1) ]
  end

end
