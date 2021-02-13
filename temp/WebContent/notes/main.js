
  


function deleteItem() {
  $(this).closest(".box").fadeOut(300);
}

function deleteIteml() {
  $(this).parent().remove();
}

function strikeOut() {
  if ($(this).closest(".box").css('textDecoration') == 'line-through') {
    $(this).closest(".box").css('textDecoration', 'none');
    $(this).closest(".box").css('background-color', 'white');
  } else {
    $(this).closest(".box").css('textDecoration', 'line-through');
    $(this).closest(".box").css('background-color', '#ffa500');
  }
}

$(function() {
  $("#addtodo").on('click', addItem);
  $(document).on('click', '.delete', deleteItem);
  $(document).on('click', '.deletel', deleteIteml);
  $(document).on('click', '.strike', strikeOut);
});

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#pic')
        .attr('src', e.target.result)
        .width(500)
        .height(200);
    };
    reader.readAsDataURL(input.files[0]);
  }
  $("#form1").val('');
}


//Change from grid view to list view
function myFunction() {
  document.getElementById("Menuitems").style.display = "block";
  document.getElementById("holder").style.display = "none";
  document.getElementById("icn").style.display = "block";
  document.getElementById("change").style.display = "none";
  document.getElementById("myButton1").style.display = "none";
  document.getElementById("myButton").style.display = "block";

}

function myFunction1() {
  document.getElementById("Menuitems").style.display = "none";
  document.getElementById("holder").style.display = "block";
  document.getElementById("icn").style.display = "none";
  document.getElementById("change").style.display = "block";
  document.getElementById("myButton1").style.display = "block";
  document.getElementById("myButton").style.display = "none";

}

// Adding Quick Notes
function myFunctionAddnote() {
  document.getElementById("show").style.display = "none";
  document.getElementById("hidden").style.display = "block";

}

function functionhide() {
  document.getElementById("form").style.display = "none";
  document.getElementById("form1").style.display = "block";
  document.getElementById("pic").style.display = "block";

}


// Get the modal
var modal = document.getElementById('myModal');
var modal1 = document.getElementById('myModal1');
var modal2 = document.getElementById('myModal2');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var btn1 = document.getElementById("myBtn1");
var btn2 = document.getElementById("myBtn2");


// Get the <span> element that closes the modal
var del = document.getElementsByClassName("close");

// When the user clicks the button, open the modal


btn2.onclick = function() {
  modal2.style.display = "block";
}

// When the user clicks on (X), close the modal
function myFunctionclose() {
  document.getElementById("myModal").style.display = "none";
  document.getElementById("myModal1").style.display = "none";
  document.getElementById("myModal2").style.display = "none";
}



// Change background color of div for list
function blue() {
  document.getElementById('header').style.backgroundColor = '#20b2aa'
}

function orange() {
  document.getElementById('header').style.backgroundColor = "#ff8c00"
}

function green() {
  document.getElementById('header').style.backgroundColor = "green"
}

function pink() {
  document.getElementById('header').style.backgroundColor = "pink"
}
