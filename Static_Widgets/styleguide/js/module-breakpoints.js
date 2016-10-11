(function() {
   // Localize jQuery variable
   var jQuery;
   /******** Load jQuery if not present *********/
   if (window.jQuery === undefined || window.jQuery.fn.jquery !== '2.1.4') {
       var script_tag = document.createElement('script');
       script_tag.setAttribute("type","text/javascript");
       script_tag.setAttribute("src",
           "http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js");
       if (script_tag.readyState) {
         script_tag.onreadystatechange = function () { // For old versions of IE
             if (this.readyState == 'complete' || this.readyState == 'loaded') {
                 scriptLoadHandler();
             }
         };
       } else { // Other browsers
         script_tag.onload = scriptLoadHandler;
       }
       // Try to find the head, otherwise default to the documentElement
       (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script_tag);
   } else {
       // The jQuery version on the window is the one we want to use
       jQuery = window.jQuery;
       main();
   }

   /******** Called once jQuery has loaded ******/
   function scriptLoadHandler() {
       // Restore $ and window.jQuery to their previous values and store the
       // new jQuery in our local jQuery variable
       jQuery = window.jQuery.noConflict(true);
       // Call our main function
       main();
   }

   /******** Our main function ********/
   function main() {
       jQuery(document).ready(function($) {

         function exampleWidths() {
           $('.kss-modifier__example').each(function() {
             var width = $(this).width();

             $(this).css('width', width);
           });
         }
         exampleWidths();

           //Toggle breakpoint viewing
           function toggleBreakpoint() {
               var radio = $('.switch-field input[type="radio"]');
               var origin = $('.kss-modifier__example').width();

               radio.on('click', function() {
                 var val = $(this).val();
                 if( !$('body').hasClass(val)) {
                   $('body').removeClass().addClass(val);
                 }

                 if (val == 'desktop') {
                   $('.kss-modifier__example').css('width', origin);
                 }
                 if (val == 'tablet') {
                   $('.kss-modifier__example').css('width', 640);
                 }
                 if (val == 'phone') {
                   $('.kss-modifier__example').css('width', 320);
                 }
               })
               //Hide Breakpoint Switcher on Branding page
               if( $('.kss-nav__menu-item:first-child a.active').length || $('#kssref-branding').length ) {
                 $('.switch-field').hide();
               }
            }
            toggleBreakpoint();
       });
   }

})();
