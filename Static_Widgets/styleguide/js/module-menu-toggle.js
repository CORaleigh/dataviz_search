$(function() {

  $('#kss-menu-toggle').click(function() {

    // Toggle class on body

    if ( $('#kss-node[data-menu]').length ) {
      $('#kss-node').removeAttr('data-menu');
    }
    else {
      $('#kss-node').attr('data-menu', 'hidden');
    }



  });

});
