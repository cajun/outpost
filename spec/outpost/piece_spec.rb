require 'spec_helper'


describe Outpost::Piece do
  let(:board) {
    b = Outpost::Board.new
    b.pieces.clear
    b.squares.each { |s| s.piece = nil }
    b
  }
  let(:piece_klass) { Class.new(OpenStruct) { include Outpost::Piece } }

  let(:queen) {
    piece        = piece_klass.new(board:board, color: :white)
    piece.square = board.squares.find(rank: 4, file: 'e').first
    piece
  }

  let(:king) {
    piece        = piece_klass.new(board:board, color: :white)
    piece.square = board.squares.find(rank: 5, file: 'c').first
    piece
  }

  context '#diagonal' do
    subject { queen.diagonal }

    its(:size) { should be 14 }

    %w(a8 b1 b7 c2 c6 d3 d5 e4 f3 f5 g2 g6 h1 h7).each do |notation|

      it "is on '#{notation}'" do
        val = subject.detect{ |square| square.notation == notation }
        val.notation.should eq notation
      end

    end

  end

  context '#horizontal' do
    subject { queen.horizontal }

    its(:size) { should be 15 }

    %w(e1 e2 e3 e4 e5 e6 e7 e8 a4 b4 c4 d4 g4 h4).each do |notation|

      it "is on '#{notation}'" do
        val = subject.detect{ |square| square.notation == notation }
        val.notation.should eq notation
      end

    end

  end


end
