require 'spec_helper'


describe Outpost::Piece::Create do
  let(:board) { Outpost::Board.new }

  it 'has 32 pieces' do
    subject.pieces(board).size.should eq 32
  end

  it 'has 8 pawns' do
    subject.pawns(board, :white).size.should eq 8
  end

  it 'has 2 knights' do
    subject.knights(board, :white).size.should eq 2
  end

  it 'has 2 bishops' do
    subject.bishops(board, :white).size.should eq 2
  end

  it 'has 2 rooks' do
    subject.rooks(board, :white).size.should eq 2
  end

  it 'has 1 queen' do
    subject.queen(board, :white).size.should eq 1
  end

  it 'has 1 king' do
    subject.king(board, :white).size.should eq 1
  end

end


