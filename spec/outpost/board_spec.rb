require 'spec_helper'


describe Outpost::Board do
  let(:board) { Outpost::Board.new }
  #subject { board }

  #its(:files)  { should eq 'a' .. 'h'        }
  #its(:ranks)  { should eq 1 .. 8            }
  #its(:colors) { should eq [:black, :white ] }


  describe '#squares' do
    subject { board.squares }
    its(:size) { should eq 64 }
  end

end
