# Mbrane

------

This is a project made for the PLOG course.

Made by João Campos (https://github.com/Pastilhas) and Leonardo Moura (https://github.com/leonardofmoura).

### Project

Our objective with this project is to recreate the game Mbrane using Prolog language. After making a Prolog program for the game, we will then focus on creating a bot for a single player to play against. This bot will have different difficulties, from easy to hard, the harder the difficulty the more precise are the steps taken by the bot.



### Game

This game, Mbrane, is very similar to Sudoku, but it is played by two rivals. the board starts empty, and each player places a piece that has a number from 0 to 8. Depending on the piece placed and its location, that player gains different amounts of Power (points on the block the piece is placed) and Influence (points that are spread to nearby blocks).

The game continues and a piece of the same number cannot be repeated on a given block, line or column. Once there are no more possible steps, the game advances to the second phase. On this second phase, the player that has the most points on a given block, becomes its owner. Once he becomes its owner, all the pieces from the other player are converted and increase the player influence on other blocks.



### Features

- Text-based board
- Main menu