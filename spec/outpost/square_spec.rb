require 'spec_helper'

describe Outpost::Square do
  subject { Outpost::Square.new file: 'e', rank: 1, color: :white }

  its(:notation) { should eq 'e1' }
end
