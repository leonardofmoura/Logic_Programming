# Predicates

## Main

### mbrane

Opens the main menu. The user can choose a number from 0 to 3 to continue. 3 will exit the game, 2 will open the about menu, 1 will open the instructions and finally 0 will start the game.

### display_game(+Board,+Player)

Shows the game UI and display the board on the screen. +Board is used to identify the current state of the board and +Player is used to identify the name of the player.



## Menu

### main_menu(-OP)

Displays the main menu and waits for the user to enter one option. The option entered is returned to mbrane with -OP.

### instructions_menu

Prints the basic instructions for the game.

### about_menu

Shows the credits and date of creation.

### game_ui(+Player)

Displays header of the game with player name with +Player.

### clear

Clears the screen to keep it clean and simple for the player to read.



## Utility

### get_option(-OP)

Waits for the user to write a character and then Enter.

### wait_enter

Waits for the user to hit Enter.



## Board

### board and board_blocks

Store the board in two different styles. The board is a list of lines, which allows easy printing of the board on the screen and checking of the moves on lines and columns. The board_blocks stores the board as a list of blocks, allowing easy calculation of power and checking moves on the block.

### board_influence

Stores the power of each block.

### save_board(+BL,+BC,+BB)

Saves board after placing a piece.

### destroy_board(-BL,-BC,-BB)

Destroys outdated board.

### display_board(+Board)

Displays the board line by line on the screen.

### draw_line(+Line)

Draw the line on the screen.



## Moves

### move(+X,+Y,+V)

Checks if the move is possible, places the piece on the board and updates the power.

### check_move(+X,+Y,+V)

Verifies if the values given are possible for the move and if the place is unoccupied.

### place_piece(+X,+Y,+V)

Changes the board to place piece.

### update_power(+B,+V)

Updates influence board with the value V in the given block B.

### update_influence(+B,+N,+V)

Update influence to adjacent blocks depending on position.