require 'spec_helper'


describe Outpost::Squares do
  let(:board) { Outpost::Board.new }
  subject { board.squares }

  describe '#black' do
    its('black.size') { should eq 32 }
  end

  describe '#white' do
    its('white.size') { should eq 32 }
  end


  describe '#find' do
    it { should respond_to :find }
    context 'when finding file: "a"' do
      subject { board.squares.find file: 'a' }
      it { should have(8).items }
      it { subject.map(&:file).uniq.should eq ['a'] }
    end

    context 'when finding rank: 4' do
      subject { board.squares.find rank: 4 }
      it { should have(8).items }
      it { subject.map(&:rank).uniq.should eq [4] }
    end

    context 'when finding file: "b", rank: 2' do
      subject { board.squares.find file: 'b', rank: 2 }
      it { should have(1).item }
      it { subject.first.file.should eq 'b' }
      it { subject.first.rank.should eq 2 }
    end

    context 'when finding notation: "e8"' do
      subject { board.squares.find notation: 'e8' }
      it { should have(1).item }
      it { subject.first.file.should eq 'e' }
      it { subject.first.rank.should eq 8 }
    end

    context 'when finding color: :white' do
      subject { board.squares.find color: :white }
      it { should have(32).items }
      it { subject.map(&:color).uniq.should eq [:white] }

    end
  end

end


