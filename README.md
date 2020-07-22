[![Build Status](https://travis-ci.com/tommyrharper/rps-challenge.svg?branch=master)](https://travis-ci.com/tommyrharper/rps-challenge) <img src="https://img.shields.io/badge/coverage-100%25-brightgreen" alt=""> <img src="https://img.shields.io/badge/RuboCop-No%20Offences-brightgreen" alt="">
# RPS Challenge

Here is a simple rock, paper, scissors game/web app, you can download and play in your browser. 

## Instructions

1. Run the following from your command line to start using the program:
```
git clone git@github.com:tommyrharper/rps-challenge.git
cd rps-challenge
bundle
rackup
```
2. Enter into your web browser
```
localhost:9292
```
3. Have fun and play!

## File system

```
├── app
│   └── rps_web.rb
│   └── public
│       └── style.css
│   └── views
│       └── index.erb
|       └── choice.erb
|       └── choose.erb
|       └── result.erb
├── lib
│   ├── game.rb
│   ├── computer.rb
│   └── player.rb
└── spec
    └── spec_helper.rb
    └── computer_spec.rb
    └── game_spec.rb
    └── player_spec.rb
    └── features
        └── features_spec.rb
        └── web_helpers.erb
```
  - app - folder contains the server file and the views.
    - rps_web.rb - server file.
  - views - folder contains all the views.
    - index.erb - is where you select and enter your name - this sends you to /name where the Game instance is initialized. It then redirects you to /choose.
    - choose.erb - this page shows your name and gives you three choices - rock, paper and scissors - then send you to choice.erb
    - choice.erb - tells you what you chose and allows you to click_button 'Result' taking you to result.erb.
    - result.erb - lets you know what the computer chose, whether you won, lost or drew, and give you the option to play again.
- spec - folder contains all the spec tests and relevant testing material.
    - computer_spec - tests computer.rb.
    - player_spec - tests player.rb.
    - game_spec - tests game_spec.rb.
    - spec_helper.rb - allows rspec to function correctly.
- features - folder contains feature testing material.
    - feature_spec.rb contains all the major feature tests.
    - web_helpers.rb contains repeatable testing code within functions.
- lib - folder contains model components
    - computer.rb - the Computer class controls the computers response, rock, paper or scissors.
    - player.rb - the Player class contains the players name and their move, rock, paper or scissors.
    - game.rb - the Game class contains instances of both the player and the computer, and calculates the result of the game, win, loss or draw.

## My developmental approach

I used to TDD to buid this simple application, using rspec and capybara to ensure 100% test coverage across the system infrastructure. This began with building feature tests for the user stories, fulfilling the requirements with the simplest possible code, and then expanding from there.


```
As a marketeer
So that I can see my name in lights
I would like to register my name before playing an online game
```
For the first user story (above), I started by writing a feature test:
```ruby
feature 'I want there to be a form I can fill in and see my name up in lights after' do
  scenario 'fill in form and submit' do
    enter_name
    expect(page).to have_content 'Tom'
  end
end
```
I ran rspec and got a test failure.

Then I fulfilled the test using the following code on rps_web.rb
```ruby
class RPSWeb < Sinatra::Base 

  get '/' do
    erb :index
  end

  post '/name' do
    @player_name = params[:name]
    erb :name
  end

end
```
And on index.erb
```
<form action="/name" method="post">
  Player name:
  <input type="text" name="name">
  <input type="submit" value="Submit">
</form>
```
And on name.erb
```
<%= @player_name %>
```
At this point I rspec and the test passed.

Eventually this code became obselete, but this is an example of how I used TDD to drive the creation of my application, based on the user needs described in the user stories.

## MVC

I used the Model-View-Controller setup to structure my application. This meant I kept all the front end visual information such as HTML in a views folder. I kept the controller as skinny as possible, minimising the logic in rsp_web.rb, my controller file. Then I extracted all the logic to the model, which is kept in the lib folder.

### Styling

I came back to this project after Makers Academy course was completed to style and deploy it so it can have a space on my portfolio.

To do this first a made a directory ```/app/public```. Then I created a CSS file ```styleS.css``` and imported that into my application pages.

Then I simply added some styling.

Below are the instructions I was given to create this application:

-----------------

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
----

Knowing how to build web applications is getting us almost there as web developers!

The Makers Academy Marketing Array ( **MAMA** ) have asked us to provide a game for them. Their daily grind is pretty tough and they need time to steam a little.

Your task is to provide a _Rock, Paper, Scissors_ game for them so they can play on the web with the following user stories:

```
As a marketeer
So that I can see my name in lights
I would like to register my name before playing an online game

As a marketeer
So that I can enjoy myself away from the daily grind
I would like to be able to play rock/paper/scissors
```

Hints on functionality

- the marketeer should be able to enter their name before the game
- the marketeer will be presented the choices (rock, paper and scissors)
- the marketeer can choose one option
- the game will choose a random option
- a winner will be declared


As usual please start by

* Forking this repo
* TEST driving development of your app


## Bonus level 1: Multiplayer

Change the game so that two marketeers can play against each other ( _yes there are two of them_ ).

## Bonus level 2: Rock, Paper, Scissors, Spock, Lizard

Use the _special_ rules ( _you can find them here http://en.wikipedia.org/wiki/Rock-paper-scissors-lizard-Spock_ )

## Basic Rules

- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on test coverage
----------------------

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
on your pull request:

```ruby
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

You can see your test coverage when you run your tests. If you want this in a graphical form, uncomment the `HTMLFormatter` line and see what happens!
