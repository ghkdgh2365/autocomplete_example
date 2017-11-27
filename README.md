
## Example for learning autocomplete. 자동완성기능을 배우기 위한 예제입니다.

### ruby on rails

https://github.com/jquery-ui-rails/jquery-ui-rails 를 이용해서

gemfile 문서에 아래와 같이 추가하고 

```ruby
    gem 'jquery-ui-rails'
```
gem 파일을 설치합니다. (터미널에 bundle install)

설치가 완료됐으면 javascripts 폴더에 있는 application.js 파일에

```javascript
//= require jquery-ui
```
를 추가합니다. (jquery_ujs 아래에 추가했습니다.)

다음으로 stylesheets 폴더에 있는 application.css 파일에

```css
    /*
    ...
    
    *= require jquery-ui
    
    ...
    */
```
를 추가합니다. (*= require jquery-ui 를 중간에 삽입.)

다음으로 터미널창에 scaffold 를 아래와 같이 사용합니다. 

```ubuntu
    rails g scaffold dictionary main_word:string pronounce:string type:string meaning:string example:text
```

만들어졌다면 rake db:migrate 를 터미널창에 써줍니다.

이제 검색을 했을 때 나올만한 자료가 필요하니 seeds.rb 파일에 자료를 입력해줍니다.
(github 자료에 있는 seeds.rb 참고)

입력했다면 터미널 창에 rake db:seed 를 입력합니다.

입력이 됐다면 model 에 dictionary.rb 파일에

```ruby
def self.search(term)
  where('LOWER(main_word) LIKE :term OR LOWER(meaning) LIKE :term', term: "%#{term.downcase}%")
end
```
를 추가해줍니다. 위의 코드는 main_word 혹은 meaning에 작성한 검색어가 들어있다면 dictionary 모델에서 찾아주는 기능입니다.

그 다음 controller 에 dictionaries_controller 파일에 index를 아래와 같이 적어줍니다.

```ruby
  def index
    respond_to do |format|
      format.html
      format.json { @dictionaries = Dictionary.search(params[:term]) }
    end
  end
```

그 다음 views 에 index.html.erb 파일에

```html
  <div class="dictionary-search">
    <input type="text" id="dictionary-search-txt" autofocus>
    <div class="results" id="dictionary-search-results"></div>
  </div>
```
를 입력해줍니다.

다음으로 index.json.jbuilder 에 아래와 같이 입력합니다.

```json
json.array!(@dictionaries) do |dictionary|
  json.main_word    dictionary.main_word
  json.pronounce    dictionary.pronounce
  json.type         dictionary.type
  json.meaning    dictionary.meaning
  json.example  dictionary.example
end
```

그 다음 javascripts 폴더에 dictionaries.js 파일을 하나 만들어주고 그 안에

```javascript
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
```
를 입력합니다. 그 후 index.html.erb 에

```html
<script>
  $(function() {
    new app.Books;
  });
</script>
```
를 입력합니다.

마지막으로 index.html.erb 파일에

```html
<style>
.dictionary-search input {
  width: 100%;
  font-size: 1em;
  padding: .5em 1.3em;
  background: transparent;
  border: 1px solid #ddd;
  border-radius: 2em;
}

.dictionary-search input:focus {
  border-color: #A5CEF5;
}

.dictionary-search .results .ui-widget-content {
  background: #fff;
  font-size: .9em;
  padding: .5em 0;
  border-color: #ddd;
  box-shadow: 0 .1em .2em rgba(187, 187, 187, 0.64);
  line-height: 1.2;
  max-height: 20em;
  overflow: hidden;
  overflow-y: auto;
}

.dictionary-search .results .ui-menu-item {
  font-family: 'Helvetica Neue', Helvetica, sans-serif;
  padding: .4em .6em .4em 6.2em;
  position: relative;
  border: 0;
  border-left: 5px solid transparent;
  position: relative;
  height: 6.5em;
}

.dictionary-search .results .ui-state-focus {
  background: #fff;
  border-left-color: #08c;
  font-weight: 300;
}

.dictionary-search .results .ui-menu-item .main_word {
  display: block;
  color: #555;
}

.dictionary-search .results .ui-menu-item .meaning {
  display: block;
  font-size: .8em;
  text-transform: uppercase;
  color: #aaa;
  margin-top: .6em;
  letter-spacing: 1px;
}

.dictionary-search .results .ui-menu-item .type {
  display: block;
  font-size: .8em;
  color: #aaa;
  margin-top: .5em;
}

.dictionary-search .results .ui-state-focus .type,
.dictionary-search .results .ui-state-focus .meaning,
.dictionary-search .results .ui-state-focus .main_word {
  color: #08c;
}
</style>
```
를 입력해줍니다.

*reference - http://lugolabs.com/articles/20-jquery-ui-autocomplete-with-ruby-on-rails 