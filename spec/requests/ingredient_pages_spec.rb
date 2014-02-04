require 'spec_helper'

describe "Ingredient pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "ingredient creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a ingredient" do
        expect { click_button "save ingredient" }.not_to change(Ingredient, :count)
      end

      describe "error messages" do
        before { click_button "save ingredient" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'ingredient_name', with: "Lorem ipsum" }
      it "should create a ingredient" do
        expect { click_button "save ingredient" }.to change(Ingredient, :count).by(1)
      end
    end
  end
end