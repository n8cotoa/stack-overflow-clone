require 'rails_helper'

describe User do
  it { should have_many :posts }
  it { should have_many :responses }
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :name }
  it { should validate_confirmation_of :password }
end
