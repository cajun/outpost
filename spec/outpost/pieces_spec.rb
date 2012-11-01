require 'spec_helper'

shared_examples 'players pieces' do

  def filter_by klass
    pieces.select{|piece| klass === piece}
  end

  subject {pieces}
  its(:size) { should eq 16 }

  context 'pawns' do
    subject { filter_by Outpost::Piece::Pawn }
    its(:size) { should eq 8 }
  end

  context 'knights' do
    subject { filter_by Outpost::Piece::Knight }
    its(:size) { should eq 2 }
  end

  context 'bishops' do
    subject { filter_by Outpost::Piece::Bishop }
    its(:size) { should eq 2 }
  end

  context 'rooks' do
    subject { filter_by Outpost::Piece::Rook }
    its(:size) { should eq 2 }
  end

  context 'queen' do
    subject { filter_by Outpost::Piece::Queen }
    its(:size) { should eq 1 }
  end

  context 'king' do
    subject { filter_by Outpost::Piece::King }
    its(:size) { should eq 1 }
  end

end

describe Outpost::Piece do
  let(:board) { Outpost::Board.new }

  describe 'black' do
    it_behaves_like 'players pieces' do
      let(:pieces) {board.pieces[:black]}
    end
  end

  describe 'white' do
    it_behaves_like 'players pieces' do
      let(:pieces) {board.pieces[:white]}
    end
  end

end
