# jekyll-chess
A jekyll plugin for displaying static chess boards.

## How to Use

Currently, to use this plugin you have to set it up manually. 
Download or clone this repository and follow the steps below:

1. Copy `plugin/chess.rb` to your _plugins folder.
2. Copy `sass/chess.scss` to your _sass folder if your site is configured to use SASS. Alternatively, copy the precompiled chess.css to where you keep your style sheets.
3. Copy the images of the chess pieces in `assets` to whereever you would like them.
4. Update the `$assets-root` variable to match the path to the images of the chess pieces, or manually update the paths if you are using the css file.
5. Finally, use {% fenboard <FEN NOTATION STRING> %} to render a chess board on your string. For example, `{% fenboard r3r1kR/2p5/p1p1P3/1p4q1/1P2P3/P2P1P2/2P1KB2/Q7 b - - 2 27 %}` render the below image.

![Example chessboard](/screenshot.png)