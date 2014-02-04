require 'spec_helper'

describe Ingredient do

  let(:user) { FactoryGirl.create(:user) }
  before { @ingredient = user.ingredients.build(name: "Lorem ipsum") }

  subject { @ingredient }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:proof) }
  it { should respond_to(:rating) }
  it { should respond_to(:brand) }
  it { should respond_to(:category) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }


  it { should be_valid }

  describe "when name is not present" do
    before { @ingredient.name = nil }
    it { should_not be_valid }
  end

end