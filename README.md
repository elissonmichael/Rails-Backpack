## Backpack

This project implements a backpack system for an inventory on a game.

## Introduction

* A backpack keeps many items for a player;

* An item has name, weight and size (how many spaces it occupies);

* A backpack may have different capacities (total spaces available) and weight limits, because the game has different characters;

* A backpack has a method that allows us to know if it is overweight (weight of the items it higher than the weight limit from the backpack);

* Backpack has an interface that allows us to add an item and check its quantity;

* It should not be possible to add an item when it cannot fit on the backpack (item size is above the available capacity on the backpack).

## Instructions

This project uses rails 5.2.3 with the default gem set.

* Clone the project `git clone https://github.com/elissonmichael/Rails-Backpack.git`

* `cd Rails-Backpack`

* `bundle check`

* `bundle install` if neccessary

* `rails db:create`

* `rails db:migrate`

* `rails db:seed`

* `rails s`

* Open your browser and access [http://localhost:3000](http://localhost:3000)

## Testing

Click on the links below if you want to go read some tests. You can run each test using this commands:

* [Model Testing](https://github.com/elissonmichael/Rails-Backpack/blob/master/test/models/backpack_test.rb) - `rails test test/models/`

* [Functional Tests](https://github.com/elissonmichael/Rails-Backpack/blob/master/test/controllers/backpacks_controller_test.rb) - `rails test test/controllers/`

* [System Testing](https://github.com/elissonmichael/Rails-Backpack/blob/master/test/system/backpacks_test.rb) - `rails test:system`
