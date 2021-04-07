/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(".multi-item-carousel").carousel({
  interval: false,
});

// for every slide in carousel, copy the next slide's item in the slide.
// Do the same for the next, next item.
$(".multi-item-carousel .item").each(function () {
  var next = $(this).next();
  if (!next.length) {
    next = $(this).siblings(":first");
  }
  next.children(":first-child").clone().appendTo($(this));

  if (next.next().length > 0) {
    next.next().children(":first-child").clone().appendTo($(this));
  } else {
    $(this)
      .siblings(":first")
      .children(":first-child")
      .clone()
      .appendTo($(this));
  }
});


