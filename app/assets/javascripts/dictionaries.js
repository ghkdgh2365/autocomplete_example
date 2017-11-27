var app = window.app = {};

app.Dictionaries = function() {
  this._input = $('#dictionary-search-txt');
  this._initAutocomplete();
};

app.Dictionaries.prototype = {
    _initAutocomplete: function() {
      this._input
        .autocomplete({
          source: '/dictionaries',
          appendTo: '#dictionary-search-results',
          select: $.proxy(this._select, this)
        })
        .autocomplete('instance')._renderItem = $.proxy(this._render, this);
    },
    
    _select: function(e, ui) {
      this._input.val(ui.item.main_word + ' - ' + ui.item.meaning);
      return false;
    },
    
    _render: function(ul, item) {
      var markup = [
        // '<span class="img">',
        //   '<img src="' + item.image_url + '" />',
        // '</span>',
        '<span class="main_word">' + item.main_word + '</span>',
        '<span class="meaning">' + item.meaning + '</span>',
        '<span class="type">' + item.type + '</span>'
      ];
      return $('<li>')
        .append(markup.join(''))
        .appendTo(ul);
    }

};