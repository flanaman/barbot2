require 'spec_helper'

describe "Authentication" do

	subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('sign in') }
    it { should have_title('sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "sign in" }

      it { should have_title('sign in') }
      it { should have_selector('div.alert.alert-error') }
      
      describe "after visiting another page" do
			  before { click_link "home" }
				it { should_not have_selector('div.alert.alert-error') }
			end
    end
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "email",    with: user.email.upcase
        fill_in "password", with: user.password
        click_button "sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('profile',     href: user_path(user)) }
      it { should have_link('sign out',    href: signout_path) }
      it { should_not have_link('sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "sign out"}
        it { should have_link "sign in" }
      end
    end
  end

end
