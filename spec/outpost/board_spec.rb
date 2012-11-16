require 'spec_helper'


describe Outpost::Board do
  let(:board) { Outpost::Board.new }
  subject { board }

  its(:files)  { should eq 'a' .. 'h'        }
  its(:ranks)  { should eq 1 .. 8            }
  its(:colors) { should eq [:black, :white ] }


  describe '#squares' do
    subject { board.squares }
    its(:size) { should eq 64 }
  end

  describe '#setup_pieces' do
    it 'has pieces on unique squares' do
      all    = board.pieces.map(&:square).compact
      unique = board.pieces.map(&:square).compact.uniq{|x| [x.rank, x.file]}
      unique.length.should eq all.length
    end

    it 'has all pieces on squares' do
      board.pieces.map(&:square).compact.length.should be 32
    end

    it 'squares have 32 pieces' do
      board.squares.map(&:piece).compact.length.should be 32
    end
  end

end
