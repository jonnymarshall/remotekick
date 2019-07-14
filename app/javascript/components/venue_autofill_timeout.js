const venueAutofillTimeout = () => {
  $(function(){
    var input = $('input'),
        out = $('.output'),
        keyUpTimeout,
        fetchData = function(){
          out.html('Timeout expired.');
        }

      input.on('keypress blur', function(){
        var target = $(this);

        if (target.val().length < 3) {
          out.html('Value too short, skipping');
          return;
        }

        //If the value has changed (ignores arrow-keys, etc)
        if (target.data('last-value') != target.val()) {
          out.html('Value changed, setting timeout.');
          //Cancel the timer
          clearTimeout(keyUpTimeout);

          //Reset the timer
          keyUpTimeout = setTimeout(fetchData, 500);

          //Stash the current value on the element
          target.data('last-value', target.val());
        } else {
          out.html('Value unchanged, ignoring.');
        }
    });
  });
}

export { venueAutofillTimeout }
