$(function() {

  // Syntax hightlignting with Rainbow.js
  $('code.html').attr('data-language', 'html');
  $('code.css').attr('data-language', 'css');
  $('code.less, code.scss').attr('data-language', 'generic');

  // Show/hide source code for components
  $('.kss-markup pre').before('<span class="kss-view-source"><img width="16" height="16" src="assets/i_source.svg" /> <a class="kss-view-source" href="javascript:void(0)">View Source</a></span>');
  $('.kss-markup pre').hide();
  $('.kss-view-source').click(function() {
      $(this).next().slideToggle(250);
  });

});
