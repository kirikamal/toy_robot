# Toy Robot

#### What is this ?

Toy Robot is a ruby coding exercise given by interviewer's to candidates to understand their capabilities.

#### What do I need to do ?

## Specification

### Description
- The application is a simulation of a toy robot moving on a square tabletop, 
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be 
  prevented from falling to destruction. Any movement that would result in the 
  robot falling from the table must be prevented, however further valid 
  movement commands must still be allowed.
- Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until a
  valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is currently
  facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form, but
  standard output is sufficient.
- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints
The toy robot must not fall off the table during movement. This also includes 
the initial placement of the toy robot. Any move that would cause the robot 
to fall must be ignored.

### Example Input and Output
a)
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output: `0,1,NORTH`

b)
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output: `0,0,WEST`

c)
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output: `3,3,NORTH`


###---------------------------------------------------------------------------------------------

### How to run the program
There are 4 data files in the root directory (commands1.txt, commands2.txt, commands3.txt and commands4.txt). The commands4.txt file contains invalid commands. User needs to run the program in following format:

```ruby lib/toy_robot.rb commands1.txt```

### Run the test
```rspec spec```

### My approach

My approach for this task is
1. Clean & efficient code.
2. Test coverage for core functionalities.
3. Use my recent experiences in Meta-programming and ruby inbuilt functions.
4. Read the commands from the file instead of command prompt.
