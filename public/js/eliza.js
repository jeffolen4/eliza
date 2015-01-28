$(document).ready(function() {

  var form = $("#eliza-form");

  form.submit( function (event) {
    event.preventDefault();
    var ans = $("#user-resp").val();
    var response_table = $('#conversation-tb');
    $.ajax({
      type: "POST",
      url: "/eliza",
      data: { query: ans }
    })
      .done(function( msg ) {
        var newTableRow = $('<tr><td>' + ans + '</td><td>' + msg + '</td></tr>');
        response_table.append(newTableRow);
      });

  })

});
