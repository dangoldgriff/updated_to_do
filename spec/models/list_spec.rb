require 'spec_helper'

describe List do
  it { should have_many :tasks }
  it { should belong_to :user }
end  