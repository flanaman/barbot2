require 'spec_helper'

describe Cocktail do

  let(:user) { FactoryGirl.create(:user) }
  before { @cocktail = user.cocktails.build(name: "Manhattan") }

  subject { @cocktail }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:components) }
  it { should respond_to(:ingredients) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @cocktail.user_id = nil }
    it { should_not be_valid }
  end
end