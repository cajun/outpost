require 'spec_helper'


describe Outpost::Board::Squares do
  let(:board) { Outpost::Board.new }
  subject { board.squares }

  describe '#black' do
    its('black.size') { should eq 32 }
  end

  describe '#white' do
    its('white.size') { should eq 32 }
  end

end


