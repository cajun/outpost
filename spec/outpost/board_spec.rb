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
    let(:taken_squares){ board.pieces.map(&:square).compact }
    let(:unique_squares){ taken_squares.uniq{ |x| [x.rank, x.file] } }

    it 'has pieces on unique squares' do
      unique_squares.length.should eq taken_squares.length
    end

    it 'has all pieces on squares' do
      taken_squares.length.should be 32
    end

    it 'squares have 32 pieces' do
      board.squares.map(&:piece).compact.length.should be 32
    end

  end

  describe 'standard_layout' do
    context 'pawns' do

      ('a' .. 'h').each do |file|
        context "white on #{file}2" do
          subject {board.pieces.find(color: :white, file: file, rank: 2 )}

          its(:length) { should eq 1 }
          its('first.class') { should eq Outpost::Piece::Pawn }
          its('first.color') { should eq :white }
          its('first.file') { should eq file }
          its('first.rank') { should eq 2 }
        end

        context "black on #{file}7" do
          subject {board.pieces.find(color: :black, file: file, rank: 7 )}

          its(:length) { should eq 1 }
          its('first.class') { should eq Outpost::Piece::Pawn }
          its('first.color') { should eq :black }
          its('first.file') { should eq file }
          its('first.rank') { should eq 7 }
        end

      end
    end


  end

end
