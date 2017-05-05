$(document).ready(function() {
  $(".recipes li").on("click", function(event) {
    event.preventDefault();

    var $recipe = this;
    var url = $(this).find("a").attr("href");

    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(response) {
      if($($recipe).hasClass("clicked")) {
        $($recipe).removeClass("clicked");
        $($recipe).find("div#recipe-details").remove();
      }
      else {
        $($recipe).addClass("clicked");
        $($recipe).append(response);
      }
    })
  })
});
