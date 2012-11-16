require 'spec_helper'


describe Outpost::Piece::Queen do
  let(:board) { Outpost::Board.new }
  let(:queen) {
    queen = board.pieces.detect{ |p| Outpost::Piece::Queen === p }
    queen.square = board.squares.find(rank: 4, file: 'e').first
    queen
  }

  it 'is the queen' do
    queen.class.should be Outpost::Piece::Queen
  end

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
