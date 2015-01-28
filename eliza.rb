require 'sinatra'

#require './public/phrase.rb'
require_relative 'phrase_list.rb'
#
set :public_folder, 'public'
#
END_SESSION = "Time's up. Make another appointment to continue."

class Eliza < Sinatra::Base

  @@questions = {}
  @@phrases = Liza::Phrase_list.new()
  @@phrases.sessionEnd = END_SESSION

  get '/' do
    redirect 'index.html'
  end

  post ('/answer') do

    ans = params["user-resp"]
    eliza_resp = @@phrases.get_response(ans)
    return eliza_resp

  end


  post ('/eliza') do

    ans = params['query']
    eliza_resp = @@phrases.get_response(ans)
    return eliza_resp

  end



  get '/tardis' do
    "<!DOCTYPE html>
    <html>
    <head>
    <link href=\"/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\">
    <link href=\"/css/animation1.css\" rel=\"stylesheet\" type=\"text/css\">
    <script src=\"/js/jquery-2.1.3.js\"></script>
    <script src=\"/js/animation1.js\"></script>
    </head>
    <body>
    <div class=\"container\">
    <div class=\"col-sm-offset-4 col-sm-3 row\">
    <div class=\"spin-fwd\" id=\"space\">
    <img class=\"spin-bkw\" id=\"spaceship\"  src=\"/img/tardis_2.png\" width=\"300px\" height=\"435px\">
    </div>
    </div>
    </div>
    </body>
    </html>"
  end

end
