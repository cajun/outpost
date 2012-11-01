require 'spec_helper'


describe Outpost::Squares::Create do
  its(:files)  { should eq ('a' .. 'h')      }
  its(:rows)   { should eq (1 .. 8)          }
  its(:colors) { should eq [:black, :white ] }

  its('squares.size') { should eq 64 }
  its('squares.first') { should be_an_instance_of Outpost::Square }
end


