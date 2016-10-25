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
  $("#slider-horizontal").slider({
      orientation: "horizontal",
      range: "min",
      min: 100,
      max: 750,
      value: 110,
      slide: function(event, ui) {
          $(".live_text_samples").css("font-size", ui.value + "%");
          $(".script_input_field").css("font-size", ui.value + "%");
          $(".script_input_field").css("height", ui.value + "%");
      }
  });
// End of Font Size Slider

// Start of Font Color
  $('#colorSelector').ColorPicker({
    color: '#000',
    onShow: function (colpkr) {
      $(colpkr).fadeIn(500);
      return false;
    },
    onHide: function (colpkr) {
      $(colpkr).fadeOut(500);
      return false;
    },
    onChange: function (hsb, hex, rgb) {
      $('#colorSelector div').css('backgroundColor', '#' + hex);
      $(".live_text_samples").css('color', '#' + hex);
      $(".script_input_field").css('color', '#' + hex);
    }
  });

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

  // Match Styling from Index on Show Page
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

