// 1. Fold up the displayed information
// 2. On click, topic unfolds categories in new rectangle
// 3. On click, category expands to hold content
$(".info-topic div, span").hide();
$(".info-topic h1").click(function() {
  $(this).siblings("div").toggle();
});

$(".info-category").click(function() {
  $(this).children("span").toggle();
});;
