module Jekyll

    # The Piece class provides the foundations for representing any
    # chess piece.
    class Piece

        # Creates a new Piece object.
        # @param symbol The symbol which represents the chess piece.
        # @param color The color of the chess piece.
        def initialize(symbol, color)
            @symbol = symbol.upcase
            @color = color.downcase
        end

        # @return The symbol which represents the chess piece.
        def get_symbol()
            return @symbol
        end

        # @return The color of the chess piece.
        def get_color()
            return @color
        end

    end

    # The Pawn class represents a chess pawn, with the symbol 'P',
    # of an arbitrary color.
    class Pawn < Piece

        # Creates a new Pawn piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('P', color)
        end

    end

    # The Knight class represents a chess pawn, with the symbol 'N',
    # of an arbitrary color.
    class Knight < Piece

        # Creates a new Knight piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('N', color)
        end

    end

    # The Bishop class represents a chess pawn, with the symbol 'B',
    # of an arbitrary color.
    class Bishop < Piece

        # Creates a new Bishop piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('B', color)
        end

    end

    # The Rook class represents a chess pawn, with the symbol 'R',
    # of an arbitrary color.
    class Rook < Piece

        # Creates a new Rook piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('R', color)
        end

    end

    # The Queen class represents a chess pawn, with the symbol 'Q',
    # of an arbitrary color.
    class Queen < Piece

        # Creates a new Queen piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('Q', color)
        end

    end

    # The King class represents a chess pawn, with the symbol 'K',
    # of an arbitrary color.
    class King < Piece

        # Creates a new King piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('K', color)
        end

    end

    # The Marker class represents a marker with the symbol 'M',
    # of an arbitrary color.
    class Marker < Piece

        # Creates a new King piece.
        # @param color The color of the chess piece.
        def initialize(color)
            super('M', color)
        end

    end

    # The Chessboard class represents an 8x8 standard chessboard.
    class Chessboard

        # Creates a new Chessboard with no pieces on it.
        def initialize()
            @board = [[nil, nil, nil, nil, nil, nil, nil, nil], 
                      [nil, nil, nil, nil, nil, nil, nil, nil],
                      [nil, nil, nil, nil, nil, nil, nil, nil],
                      [nil, nil, nil, nil, nil, nil, nil, nil], 
                      [nil, nil, nil, nil, nil, nil, nil, nil], 
                      [nil, nil, nil, nil, nil, nil, nil, nil], 
                      [nil, nil, nil, nil, nil, nil, nil, nil], 
                      [nil, nil, nil, nil, nil, nil, nil, nil]]
        end

        # @return The 2D array representing the chessboard.
        def get_board()
            return @board
        end

        # Gets the piece at the passed in indices.
        # @param i The row
        # @param j The column
        # @return The pieces at the passed in i, j indices.
        def get_square(i, j)
            return @board[i][j]
        end

        # Sets the piece at the passed in indices.
        # @param piece The picee to put at the indices.
        # @param i The i index to put the piece at.
        # @param j The j index to put the piece at.
        def set_square(piece, i, j)
            @board[i][j] = piece
        end

    end

    # The ChessboardRenderer class provides the functionality for
    # rendering a Chessboard object as an HTML table.
    class ChessboardRenderer

        def initialize()
            @alpha = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
        end

        # Gets the correct CSS style for the passed in piece and returns it.
        # @param piece The Piece object to get the CSS style of.
        # @return A string containing the CSS style which matches the piece.
        def get_piece_style(piece)
            style = ""

            if piece == nil
                return style

            else
                symbol = piece.get_symbol()
                color = piece.get_color()

                if color == 'b'
                    style += 'black-'
                elsif color == 'w'
                    style += 'white-'
                else
                    style += 'red'
                end

                case symbol
                when 'P'
                    style += 'pawn'
                when 'N'
                    style += 'knight'
                when 'B'
                    style += 'bishop'
                when 'R'
                    style += 'rook'
                when 'Q'
                    style += 'queen'
                when 'K'
                    style += 'king'
                when 'M'
                    style += 'marker'
                else
                    style += 'invalid'
                end

                return style
            end

            return style 
        end

        # Generates a row which contains pieces from the chessboard.
        # @param board_row An array from the board, containing the Piece objects on the row.
        # @param row_number Used to alternate even and odd colored rows.
        # @param display_number The number of the row i.e. 1-8.
        # @return A row containing chess Pieces for an HTML table.
        def generate_game_row(board_row, row_number, display_number)
            
            row = '<tr>'

            for i in (0..9)
                if i == 0 || i == 9
                    row += '<td class="number">' + display_number.to_s() +'</td>' 
                else
                    if i % 2 == 0 
                        if row_number % 2 == 0
                            row += '<td class="light ' + get_piece_style(board_row[i - 1]) + '"></td>'
                        else 
                            row += '<td class="dark ' + get_piece_style(board_row[i - 1]) + '"></td>'
                        end
                    else
                        if row_number % 2 == 0
                            row += '<td class="dark ' + get_piece_style(board_row[i - 1]) + '"></td>'
                        else 
                            row += '<td class="light ' + get_piece_style(board_row[i - 1]) + '"></td>'
                        end
                    end
                end
            end

            row += '</tr>'

            return row
        end

        # Generates the top and bottom rows of the chessboard containing
        # two corners and eight letters a-h.
        # @return A string containing a row of an HTML table.
        def generate_letter_row()

            row = '<tr>'
            row += '<td class="corner"></td>'

            for i in (0..7)
                row += '<td class="letter">' + @alpha[i] + '</td>'
            end

            row += '<td class="corner"></td>'
            row += '</tr>'

            return row
        end

        # Gets an HTML table containing a fully rendered chessboard
        # @param board The Chessboard object to render.
        # @return A string containing the fully rendered Chessboard as an HTML table.
        def get_html(board)
            table = '<table class="chess">'
            table += generate_letter_row()

            for i in (0..7)
                table += generate_game_row(board.get_board()[i], i + 1, 8 - i)
            end

            table += generate_letter_row()
            table += '</table>'

            return table
        end
    end

    # The FENParser class can parse Forsyth-Edwards Notation (FEN)
    # and organize it into an Hash. The resulting has is composed of
    # the six types of information FEN provides about a game:
    #
    #   1. Piece placement
    #   2. Active color
    #   3. Castling availability
    #   4. En passant
    #   5. Halfmove clock
    #   6. Fullmove number
    #
    class FENParser

        # Parses Forsyth-Edwards Notation (FEN).
        # @param fen A string containing standard FEN.
        # @return A Hash.
        def parse(fen)

            data = {}

            parts = fen.strip.split(" ")
            part_names = ["piece_placement", "active_color", 
                          "castling_availability", "en_passant",
                          "halfmove_clock", "fullmove_clock"]
            
            counter = 0
            for part in parts   
                data[part_names[counter]] = part
                counter += 1
            end

            return data
        end

    end

    # The FENInterpreter class has the ability to interpret parsed
    # FEN data into a Chessboard object, which can then be displayed.
    class FENInterpreter

        # Interprets parsed FEN data and returns a Chessboard representing
        # the state of the board
        # @param parsed_fen The parsed FEN data retrieved from FENParser.parse()
        # @return The Chessboard object reflecting the turn the FEN data represented.
        def interpret(parsed_fen)

            # Create our chessboard
            board = Chessboard.new()

            # Replace the forward slashes that appear in FEN piece placement strings
            # with spaces, and split on those spaces so we can easily iterate over
            # the rows of the board.
            rows = parsed_fen["piece_placement"].gsub(/\//, ' ').split(' ')

            #Iterating over each row from the FEN data
            row_counter = 0
            for row in rows

                # Because FEN uses integers to represent empty spaces,
                # we use a while statement along with a counter when 
                # interpreting where each of the pieces should go.
                square_counter = 0 
                while square_counter  < 7
                    for piece in row.split('')

                        # If the current character is a digit we increment
                        # the counter so pass over empty spaces.
                        if /\d/.match(piece)
                            square_counter += piece.to_i()
                        else

                            # FEN represents black pieces with lowercase characters and white
                            # with uppercase. Here we are looking for matches and creating the
                            # correct piece in the correct color.
                            if /[a-z]/.match(piece)
                                case piece
                                when 'p'
                                    board.set_square(Pawn.new('b'), row_counter, square_counter)
                                when 'n'
                                    board.set_square(Knight.new('b'), row_counter, square_counter)
                                when 'b'
                                    board.set_square(Bishop.new('b'), row_counter, square_counter)
                                when 'r'
                                    board.set_square(Rook.new('b'), row_counter, square_counter)
                                when 'q'
                                    board.set_square(Queen.new('b'), row_counter, square_counter)
                                when 'k'
                                    board.set_square(King.new('b'), row_counter, square_counter)
                                when 'm'
                                    board.set_square(Marker.new('b'), row_counter, square_counter)
                                else
                                    next
                                end
                            else
                                case piece
                                when 'P'
                                    board.set_square(Pawn.new('w'), row_counter, square_counter)
                                when 'N'
                                    board.set_square(Knight.new('w'), row_counter, square_counter)
                                when 'B'
                                    board.set_square(Bishop.new('w'), row_counter, square_counter)
                                when 'R'
                                    board.set_square(Rook.new('w'), row_counter, square_counter)
                                when 'Q'
                                    board.set_square(Queen.new('w'), row_counter, square_counter)
                                when 'K'
                                    board.set_square(King.new('w'), row_counter, square_counter)
                                when 'M'
                                    board.set_square(Marker.new('w'), row_counter, square_counter)
                                else
                                    next
                                end
                            end

                            square_counter += 1
                        end
                    end
                end

                row_counter += 1
            end

            return board
        end

    end

    # The FENChessboard Liquid Tag class represents a Chessboard which uses
    # FEN to determine its current state. The proper usage for this tag is:
    #
    # {% fenchessboard <FEN> %}
    #
    class FENChessboard < Liquid::Tag

        def initialize(name, tokens, args)
            super
            @name = name
            @tokens = tokens
            @args = args
            @fen = @tokens

            @parser = FENParser.new()
            @interpreter = FENInterpreter.new()
            @renderer = ChessboardRenderer.new()
        end

        def render(context)
            parsed = @parser.parse(@fen)
            if parsed.length > 0
                board = @interpreter.interpret(parsed)
                return @renderer.get_html(board)
            else
                return "<b>ERROR: The fenboard requires at least a FEN placement string</b>"
            end

        end

    end

end

Liquid::Template.register_tag('fenboard', Jekyll::FENChessboard)