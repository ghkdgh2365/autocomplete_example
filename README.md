
## Example for learning autocomplete.
## 자동완성기능을 배우기 위한 예제입니다.

### ruby on rails

https://github.com/jquery-ui-rails/jquery-ui-rails 를 이용해서

gemfile 문서에 아래와 같이 추가하고 gem 파일을 설치합니다. (터미널에 bundle install)

```ruby
    gem 'jquery-ui-rails'
```
설치가 완료됐으면 javascripts 폴더에 있는 application.js 파일에

```javascript
//= require jquery-ui
```
를 추가합니다. (jquery_ujs 아래에 추가했습니다.)

다음으로 stylesheets 폴더에 있는 application.css 파일에

```css
    *= require jquery-ui
```
를 추가합니다.

다음으로 터미널창에 scaffold 를 아래와 같이 사용합니다. 

```ubuntu
    rails g scaffold dictionary main_word:string pronounce:string type:string meaning:string example:text
```

만들어졌다면 rake db:migrate 를 터미널창에 써줍니다.


