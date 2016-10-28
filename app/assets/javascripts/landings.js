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
      max: 750,
      value: 110,
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


// Start of Font Color

// End of Font Color
  
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

// End of All JS
});

