$(document).ready(function() {
  function Listeners(listenFor, persistentDiv, clearBoo) {
    this.listenFor = listenFor;
    this.persistentDiv = persistentDiv;
    this.clearBoo = clearBoo;
    this.init = this.init();
  }

  Listeners.prototype = {
    init: function() {

      // Set variables that I'll need later
      var persistentDiv = this.persistentDiv;
      var clearBoo = this.clearBoo;
      var listenFor = this.listenFor;

      // For SAVE actions that need to clear and reload
      if (clearBoo === true) {
        console.log("loaded");
        // Listen for form submission
        $(persistentDiv).on('click', listenFor, function(event) {
          event.preventDefault();
          console.log("clicky");
          var $form =$(this).closest('form');
          var url = $form.attr('action');
          var data = $form.serialize();

          // Process post request
          // Need to send the parsed data through this also
          $.post(url, data, function(response) {
              console.log("post");
              $form.closest('div.clear-section').empty();
              $(persistentDiv).append(response);
          });
        });
      }

      if (clearBoo === false) {
        // Listen for click
        $(listenFor).on('click', function(event) {
          event.preventDefault();

          // Grab the destination
          var url = $(this).attr('href');

          // Process the AJAX
          $.get(url, function(response){
            $(persistentDiv).append(response);
          });
        });
      }
    }
  }

  var newSection = new Listeners('a.section-new', 'div#sections', false);
  var newRow = new Listeners('a.row-new', 'div#sections', false);
  var saveSection = new Listeners('input.save-section', 'div#sections', true);
  var saveRow = new Listeners('input.save-row', 'div#sections', true);

  newSection.init
  newRow.init
  saveSection.init
  saveRow.init
});