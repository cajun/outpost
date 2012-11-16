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

describe Outpost::Pieces do
  let(:board) { Outpost::Board.new }

  describe 'black' do
    it_behaves_like 'players pieces' do
      let(:pieces) {board.pieces.find(color: :black)}
    end
  end

  describe 'white' do
    it_behaves_like 'players pieces' do
      let(:pieces) {board.pieces.find(color: :white)}
    end
  end

  describe '#find' do
    subject {board.pieces}

    it { should respond_to :find }
    context 'when finding color: :white' do
      subject { board.pieces.find color: :white }
      it { should have(16).items }
      it { subject.map(&:color).uniq.should eq [:white] }
    end

    context 'when finding color: :black' do
      subject { board.pieces.find color: :black }
      it { should have(16).items }
      it { subject.map(&:color).uniq.should eq [:black] }
    end
  end


end
