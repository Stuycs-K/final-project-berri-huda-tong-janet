# Work Log

## Huda Berri

### 5/22

cloned repo, created and setup files, worked on the drawing of the board in the main file.

### 5/23

began working on the Stick class. 

### 5/24
initializing. set up the board and the sizing.

### 5/28
had to rebase the directory; took a long time
worked more on stick and the eightBall methods like setup and draw

### 5/29
wrote some of the display of stick (ended up rewriting a lot of it though)
also wrote a move method to see how

### 5/30 
sick

### 5/31 - 6/2
fixed the Stick class.
  fixed displays; set up keys and clicks to show the directions of the stick
  fixed how the stick hits cueBalls.

### 6/3
tried to get the line of the stick to show

### 6/5
wrote a helper method for beginning the turn logistics/player displays

### 6/6
Wrote the Player class and implemented turn changing logic

### 6/6
Debugged (the Stick got messed up after I changed Player class).

### 6/7
continued to debug and made design changes to the Player class/ how it shows up
Showed the Balls that went in at the bottom ofthe screen

### 6/8 - 6/9
Made final changes/fixes to the displays regarding turn changes
also fixed the "w" key to actually let it win; added a forceWin for demonstrations

## Janet Tong

### 5/23 

worked on the the getDirect() method

### 5/28

Session 1: testing getDirect() and move() --> temporary draw() method 
written, tests aren't working too well 

Session 2: wrote HitWall() so it reflects properly, added magnitudes to 
getDirect() and works as intended by the laws of physics ! 

Session 3: configured the triangle of balls, more testing 

### 5/29 

Session 1 in class: wrote contact() --> checks if the balls are in contact 
with eachother and performs collisions as necessary, however having some 
problems 


### 5/30 

Rewrote getDirect() because was incorrect before --> split into getStationaryDirect() and 
getMovingDirect() 

Began working on friction 

Need to figure out how to make sure hitWall() is timed correctly 

### 5/31 

wrote initializeBalls() and arranged the balls accordingly 

### 6/2 

continued testing with the ball collisions, running into trouble with colliding with 2+ balls 

wrote inHole() 

### 6/3 

began working on cueBall repositioning 

### 6/4 

completed cueBall repositioning, WIN/LOSS messages created based on result 
with black ball, created "demo" keys, debugging 

### 6/5 - 6/7 

looking into collision problems, began multi-collision method 

### 6/9 

finished multi-collision method although buggy, worked on player/turn 
switching 

