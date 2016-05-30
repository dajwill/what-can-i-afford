# what-can-i-afford

<!-- :bow: Please put your auspicious [Travis status button](http://docs.travis-ci.com/user/status-images/) here :bow: -->

1. [Overview](#overview)
2. [How Does It Work](#how-does-it-work)
3. [Development](#development)
4. [Assumptions](#assumption)

### Overview

Upload a CSV formatted menu of your favorite Restaurant and see what you can afford

### How Does It Work

Import the menu

``ruby app.rb menu.txt``

``ruby app.rb ~/Downloads/menu.txt``

### Development

Everything of importance live in [lib/menu.rb](https://github.com/dajwill/what-can-i-afford/blob/master/lib/menu.rb)

``menu = Menu.new``

creates a new Menu instance

Check if any combination matches your budget:

``menu.combos``

Return all item combinations within your budget:

``menu.affordable_combos``

You can update budget (if you decide you'll need to spend more):

``menu.budget = $20.00``

You can also add items to the menu:

``menu.items['Kobe Burger'] = '$19.50'``

As of right now the command line interface only makes use of exact matches and budget updates. It could also return the affordable options and allow updating menu items.

### Assumptions

This application assumes menus will be in CSV format, with the first line accounting for the customers budget

```
  budget
  menu-item, price
  menu-item, price
  menu-item, price
```
