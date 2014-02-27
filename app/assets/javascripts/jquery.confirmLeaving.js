/*
* confirmLeaving is a jQuery plugin to popup a confirm dialogue
* when user leave a page without saving the changed contents,
* to prevent miss operation.
*
* Usage:
*  $('#post').confirmLeaving();
*  $('#post').confirmLeaving('You may want to save the changes first.');
*  $('#post, #comment').confirmLeaving();
*
*  // disable it globally
*  $.confirmLeaving.disabled = true;
* ---
*/
(function($){
  var defaults = {
    disabled: false
  };

  $.confirmLeaving = function(options) {
    $.extend(defaults, options);
  }

  $.fn.confirmLeaving = function(message) {
    var elements = $(this);
    var isFormSubmitted = false;
    // store initial values to detect changes later
    var initValues = [];
    elements.each(function(index, element) {
      initValues.push($(element).val());
    })

    elements.one('keydown', function() {
      window.onbeforeunload = function() {
        if (isValueChanged() && !isFormSubmitted && !$.confirmLeaving.disabled) {
          return message || "Your changes have not been saved.";
        }
      }
    });

    elements.parents('form').submit(function() {
      isFormSubmitted = true;
    });

    var isValueChanged = function() {
      var isChanged = false;
      elements.each(function(index, element) {
        isChanged = isChanged || $(element).val() !== initValues[index]
      });
      return isChanged;
    };
  };
})(jQuery);
