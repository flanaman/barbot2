require 'spec_helper'

describe Component do

  let(:cocktail) { FactoryGirl.create(:cocktail) }
  # let(:ingredient) { FactoryGirl.create(:ingredient) }
  let(:component) { cocktail.components.build(cocktail_id: cocktail.id) }

  subject { component }

  it { should be_valid }

  describe "cocktail methods" do
    it { should respond_to(:cocktail) }
    its(:cocktail) { should eq cocktail }
  end

  describe "when cocktail id is not present" do
    before { component.cocktail_id = nil }
    it { should_not be_valid }
  end

  describe "when cocktail id is not present" do
    before { component.cocktail_id = nil }
    it { should_not be_valid }
  end
end