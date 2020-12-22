# Robot Challenge

[![Code Climate](https://codeclimate.com/github/RafaelChefe/toy_robot/badges/gpa.svg)](https://codeclimate.com/github/RafaelChefe/toy_robot)

## Table of contents:

* [Description](./README.md#description)
  * [Constraints](./README.md#constraints)
  * [Example Input and Output](./README.md#example-input-and-output)
  * [Deliverables](./README.md#deliverables)
* [Setup](./README.md#setup)
* [Running the app](./README.md#running-the-app)
* [Running the tests](./README.md#running-the-tests)
* [Considerations about the development](./README.md#considerations-about-the-development)
* [Examples of use](./test_data/test_data.txt)

## Description

* The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

* There are no other obstructions on the table surface.

* The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

Create an application that can read in commands of the following form:
```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.

* The origin (0,0) can be considered to be the SOUTH WEST most corner.

* The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed

* `MOVE` will move the toy robot one unit forward in the direction it is currently facing.

* `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot.

* `REPORT` will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

* A robot that is not on the table can choose to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

* Input can be from a file, or from standard input, as the developer chooses.

* Provide test data to exercise the application.

### Constraints

* The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.

* Any move that would cause the robot to fall must be ignored.

### Example Input and Output:

#### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

#### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

#### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH
    
## Setup

1. Make sure you have Ruby 2.7.2+ installed in your machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:RafaelChefe/toy_robot.git```

4. Change to the app directory:

    ```cd toy_robot```

5. Install dependencies:

    ```bundle install```

And you're ready to go!

### Running the app:
```ruby lib/main.rb```

### Running the tests:
```bundle exec rspec```

### Considerations about the development:

* Since the application is about a robot that receives and executes commands, it made perfect sense to use the [Command Pattern](https://en.wikipedia.org/wiki/Command_pattern) to implement it. It also makes it very easy to add new commands as needed, like a `TELEPORT` command, that would teleport the robot to a random place on the table.

* The table is passed along to the commands when needed, and it's responsible for checking if a position is valid or not. If we need, say, a flying robot that moves in a three-dimensional space instead of a 2D table, it would be easy to implement it.

* The Commander class takes a string, parses it and return the appropriate command. The command string can come from anywhere. As it is, the commands are read from the stdinput, but the same class could be used to read commands from a text file, or from web API.

* Considering using the Decorator Pattern to implement move north, move south, etc.
