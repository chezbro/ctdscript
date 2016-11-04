$(function() {

  // Start of Live Text
  $(".script_input_field").keyup(function() {
    $.ajax({
      type: "POST",
      url: "/update_text",
      data: $("#tattoo_script_form").serialize(),
    });
  });
// End of Live Text 

// Start of Font Size Slider
  $("#slider").slider({
      orientation: "horizontal",
      range: "min",
      min: 100,
      max: 350,
      value: 150,
      slide: function(event, ui) {
          console.log(ui);
          console.log(event);
          $(".live_text_samples").css("font-size", ui.value + "%");
          $(".script_input_field").css("font-size", ui.value + "%");
          $(".script_input_field").css({
            "font-size": ui.value + "%",
            "height" :ui.value + "%"
          });
      }
  });
// End of Font Size Slider

$(".order_button").click(function(event) {
    event.preventDefault();

    var font_size = $(".script_input_field").css("font-size");
    var font_color = $(".script_input_field").css("color");
    var script = $("#tattoo_script_form");
    var serialized_script = script.serialize();
    $.ajax({
      type: "POST",
      url: "/tattoos",
      data: { script: serialized_script, size: font_size, color: font_color } 
    });

  // SVG Creation
    var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    svg.setAttributeNS(null,"id","svgDoc");
    svg.setAttributeNS(null,"height","120");
    svg.setAttributeNS(null,"width","100%");

    
    document.getElementsByTagName('body')[0].appendChild(svg);
    var svgDoc = document.getElementById('svgDoc');
    
    var txtElem = document.createElementNS("http://www.w3.org/2000/svg", "text");
    var txtColor = $(".script_input_field").css("color");
    var txtSize = $(".script_input_field").css("font-size");

    txtElem.setAttributeNS(null,"x",20);
    txtElem.setAttributeNS(null,"y",40);
    txtElem.setAttributeNS(null, "fill", txtColor);
    txtElem.setAttributeNS(null,"font-size", txtSize);


    
    var theText = $(".script_input_field").val();
    var theMSG = document.createTextNode(theText);
    txtElem.appendChild(theMSG);
     
    svgDoc.appendChild(txtElem);

});


  // JS to match User's styling from Index page
  $(function() { 
    // Currently have to refresh pg to load this JS.
    if ($(".order_script").length ) {
      var font_size = $(".tattoo_size").html().trim();
      var font_color = $(".tattoo_color").html().trim();
      $(".order_script").css("color", "#" + font_color);
      $(".order_script").css("font-size", font_size);
    }
  });
// End of Show Styling

// Change Font Families

  $(".live_text_samples").click(function() {
      $(".script_input_field").css("font-family", (this.classList[1]));

  });


// End of All JS
});

