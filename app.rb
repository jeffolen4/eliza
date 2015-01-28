require('sinatra')

get('/hello') do
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
  </html>
  "
end
