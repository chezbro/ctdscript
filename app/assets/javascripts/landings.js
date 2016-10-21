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
    }
  });

// End of Font Color

// End of JS
});

