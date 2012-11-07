require 'spec_helper'


describe Outpost::Squares::Create do
  let(:board) { Outpost::Board.new }
  it 'has 64 squares' do
    subject.squares(board).size.should eq(64)
  end

  it 'contains Outpost::Square objects' do

    subject.squares(board).first.should be_an_instance_of Outpost::Square
  end
end


