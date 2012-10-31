require 'spec_helper'


describe Outpost::Board do
  let(:board) { Outpost::Board.new }

  context 'squares' do
    subject { board.squares }
    its(:size) { should eq 64 }
  end
end
