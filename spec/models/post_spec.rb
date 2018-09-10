require 'rails_helper'

describe Post do
  it {should belong_to :user }
  it {should have_many :responses }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end