//jQuery
$name = $('input[name="complaint-name"');
$des = $('input[name="complaint-des"');
if ($name != "" && $des != ""){
$(document).ready(function () {
  //Variable declarations that use or refer to jquery should be INSIDE the ready function to make sure jquery is instanciated.
  $name = $('input[name="complaint-name"'); //notice the different declaration…



  //Notice the $varname - Now each of these is is a jquery object corresponding to the DOM element and can be used to call the .val() method directly at any time. The way you had it before would only grab the value at the time of the declarations - ie before the values are set.

  $("#button").click(function () {
    // Making it always add a icon in the type row
    var count = 0; //Store the html fragment to a variable when needed.

    var form_validated = true;
    //Add your validation tests, have them set form_validated to false if they fail
    //TODO

    if (form_validated) {
      //Now we can use our references we made before
      $("table tr:first").after(
        "<tr><td>" +
          count +
          "</td><td>" +
          $name.val() +
          "</td><td>" +
          'today' +
          '</td><td class="amount">Rs. ' +
          $amount.val() +
          "</td></tr>"
      );
      $date.val(null);
      $amount.val(null);
      $name.val(null);
      $("#if-empty").remove();
      count = count+1;
    }
  });
});
}
