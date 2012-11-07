require 'spec_helper'


describe Outpost::Squares::Create do
  its('squares.size') { should eq 64 }
  its('squares.first') { should be_an_instance_of Outpost::Square }
end


