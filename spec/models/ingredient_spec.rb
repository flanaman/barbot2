require 'spec_helper'

describe Ingredient do

  # let(:cocktail) { FactoryGirl.create(:cocktail) }
  before { @ingredient = Ingredient.create!(name: "whiskey",
    brand: "Jim Beam") }

  subject { @ingredient }

  it { should respond_to(:name) }
  # it { should respond_to(:user_id) }
  # it { should respond_to(:user) }
  it { should respond_to(:cocktails) }
  it { should respond_to(:brand) }
  # its(:ingredient) { should eq ingredient }

  it { should be_valid }

end