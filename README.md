## Roster: 
Jonathan Quang, Brian Kwong, Datian Zhang 
## Project Title: AsteroidsToo

## What is AsteroidsToo?
AsteroidsToo is a game programmed in java using Processing that is inspired by the classic arcade game <em>Asteroids<em>. 
The player can shoot asteroids to earn money and to protect the central market/base from being destroyed. 
Money can be used to purchase upgrades, weapons, walls, or storages to increase the maximum amount of money that can be held.

## How does this project work?
We have a class called <em>Moveable<em> that controls how objects move with velocity vectors. 
<em>Asteroids<em> inherit this class and move at a fixed velocity around the screen. 
We have an <em>Asteroid Spawner<em> class that manages and controls asteroids within the driver class. 
We also have a <em>Ship<em> class that has aditional functionality for movement via acceleration vectors in the direction of the ship's 
yaw (rotation on the screen) and shooting bullets. 
The <em>PlayerShip<em> class contains code for detecting keypresses and rendering of the ship as a triangle.
The Driver class for all of this is contained within <em>AsteroidsToo.pde<em>. 

## Launch Instructions
0. Make sure you have processing installed.
1. Clone this repo at the url: https://github.com/JonathanQuang/Space.git
2. Navigate to the AsteroidsToo directory.
3. Open AsteroidsToo.pde
4. Hit run (AKA, the right facing arrow inside a circle)
5. Click on the screen to start playing!
6. Have fun!

## Controls
- WASD for movement (A & D rotate you left / right, W & S accelerates you forwards / back)
- Q & E for selecting weapons
- L to fire a bullet
- B to place a wall
- N to place a storage
- M to open market interface
