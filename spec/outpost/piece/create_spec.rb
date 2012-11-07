require 'spec_helper'


describe Outpost::Piece::Create do

  its('pieces.size') { should eq 16 }

  its('pawns.size')   { should eq 8 }
  its('knights.size')  { should eq 2 }
  its('bishops.size') { should eq 2 }
  its('rooks.size')   { should eq 2 }
  its('queen.size')   { should eq 1 }
  its('king.size')    { should eq 1 }
end


