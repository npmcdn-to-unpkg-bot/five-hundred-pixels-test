$(function() {

  //--- Setup masonry grid
  var $container = $('[data-behavior=results-grid]');
  $container.imagesLoaded( function() {
    $('.grid-item').removeClass('hidden');
    $container.isotope({
      itemSelector: '.grid-item',
      packery: {
        gutter: 10
      }
    });
  });

});

//--- Show loading button text
$(document).ajaxStart(function () {
  $('[data-behavior=load-more-results]').find('button').text('Loading...');
});

//--- Reset more results buton
$(document).ajaxStop(function() {
  $container.imagesLoaded( function() {
    $('[data-behavior=load-more-results]').find('button').text('Load More Results');
  });
});
