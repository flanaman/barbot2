require 'spec_helper'

describe "Cocktail pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "cocktail creation" do
    before { visit new_cocktail_path }

    describe "with invalid information" do

      it "should not create a cocktail" do
        expect { click_button "save cocktail" }.not_to change(Cocktail, :count)
      end

      describe "error messages" do
        before { click_button "save cocktail" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'cocktail_name', with: "grog"
        fill_in 'cocktail_description', with: "groggy"
        fill_in 'cocktail_components_attributes_1_amount', with: "groggy"
      end
      it "should create a cocktail" do
        expect { click_button "save cocktail" }.to change(Cocktail, :count).by(1)
      end
    end
  end
end