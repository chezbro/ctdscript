$(function() {
  $(".script_input_field").keyup(function() {
    $.ajax({
      type: "POST",
      url: "/update_text",
      data: $("#tattoo_script_form").serialize(),
    });
  });
// End of JS
});

