$(function() {

  var submenu = $('#kss-node .kss-nav__menu-child');

  if (submenu.length) {
      submenu.prev('a').addClass('active');
  }
  else {
      $('#kss-node .kss-nav__menu-item:first-child').find('a').addClass('active');
  }

  //Smooth scrolling for menu links
  var subLinks = $('.kss-nav__menu-child > li > a');
  $(subLinks).on('click', function(e) {
    e.preventDefault();
    subLinks.removeClass('active');
    $(this).addClass('active');
    var target = $(this.hash);
        if (target.length) {
            $('html, body').animate({
            //Offset for sticky header
            scrollTop: target.offset().top - 80
        }, 800);
    }
  });

  //Prevent jumping if section heading is clicked
  $('.kss-title__permalink').on('click', function(e) {
    e.preventDefault();
  })

});
