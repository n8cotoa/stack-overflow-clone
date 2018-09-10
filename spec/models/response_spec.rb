require 'rails_helper'

describe Response do
  it { should belong_to :user }
  it { should belong_to :post }
end
