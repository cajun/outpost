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
      let(:pieces) {board.pieces.find(:black)}
    end
  end

  describe 'white' do
    it_behaves_like 'players pieces' do
      let(:pieces) {board.pieces.find(:white)}
    end
  end

  describe '#find' do
    subject {board}

    it { should respond_to :find }
    context 'when finding file: "a"' do
      subject { board.pieces.find file: 'a' }
      it { should have(8).items }
      it { subject.map(&:file).uniq.should eq ['a'] }
    end

    context 'when finding rank: 4' do
      subject { board.pieces.find rank: 4 }
      it { should have(8).items }
      it { subject.map(&:rank).uniq.should eq [4] }
    end

    context 'when finding file: "b", rank: 2' do
      subject { board.pieces.find file: 'b', rank: 2 }
      it { should have(1).item }
      it { subject.first.file.should eq 'b' }
      it { subject.first.rank.should eq 2 }
    end

    context 'when finding notation: "e8"' do
      subject { board.pieces.find notation: 'e8' }
      it { should have(1).item }
      it { subject.first.file.should eq 'e' }
      it { subject.first.rank.should eq 8 }
    end

    context 'when finding color: :white' do
      subject { board.pieces.find color: :white }
      it { should have(32).items }
      it { subject.map(&:color).uniq.should eq [:white] }

    end
  end


end
