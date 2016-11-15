# BaristaMatic
A command line simulator of an automatic coffee dispensing machine.

##Business Logic Decisions:
Each drink has its own class and it contains the ingredients that are needed to make it along with the name of the drink and its order number on the baristamatic menu. This is an attempt to adhere to Object Oriented principles and have separation of concerns for each class. The BaristaMatic class is the only one that has methods and deals with all of the logic to make drinks etc.

##Demo:
![](https://media.giphy.com/media/3oz8xYpGSpL76s7xLi/giphy.gif)

##How to Run:

Run file barista_matic_runner.rb.

####Commands:
* Drinks are ordered based on their number on the menu.
* "R" or "r": restocks inventory
* "Q" or "q": quits program

##Tests:

Test coverage for barista matic class methods through Rspec. To view tests run command line command "rspec" while in the baristamatic directory.
