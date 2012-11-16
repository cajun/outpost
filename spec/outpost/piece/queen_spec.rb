require 'spec_helper'


describe Outpost::Piece::Queen do
  let(:board) { Outpost::Board.new }
  subject {
    queen = Outpost::Piece::Queen.new
    queen.board = board
    queen.square = board.squares.first
  }
end
