## Roster: 
Jonathan Quang, Brian Kwong, Datian Zheng 
## Project Title: AsteroidsToo

## What is AsteroidsToo?
AsteroidsToo is a game programmed in java using Processing that is inspired by the classic arcade game asteroids. The player uses "a" 
and "d" to turn the ship left and right. "w" and "s" will tell the ship to accelerate forward or backward. Pressing l will cause the ship
to shoot. The player can shoot asteroids to earn money and to protect the central market/base from being destroyed. Money can be used
to purchase upgrades, weapons, walls, or storages to increase the maximum amount of money that can be held.

## How does this project work?
We have a class called moveable that controls how objects move with velocity vectors. Asteroids inherit this class and move at a fixed 
velocity around the screen. We have an asteroid spawner class that manages and controls asteroids within the driver class. 
We also have a ship class that has aditional functionality for movement via acceleration vectors in the direction of the ship's 
yaw(rotation on the screen) and shooting bullets. 
The playership class contains code for detecting keypresses and rendering of the ship as a triangle.
The driver class for all of this is contained within AsteroidsToo.pde.

## Launch Instructions
0. Make sure you have processing installed.
1. Clone this repo at the url: https://github.com/JonathanQuang/Space.git
2. Navigate to the AsteroidsToo directory.
3. Open AsteroidsToo.pde
4. Hit run (AKA, the right facing arrow inside a circle)
5. Double click on the screen that pops up to enable detectiong of keypresses.
