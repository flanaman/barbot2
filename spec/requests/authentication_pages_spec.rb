require 'spec_helper'

describe "Authentication" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }

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
      before { sign_in user }

      it { should have_title(user.name) }
      it { should have_link('profile',     href: user_path(user)) }
      it { should have_link('users',       href: users_path) }
      it { should have_link('sign out',    href: signout_path) }
      it { should have_link('settings',    href: edit_user_path(user)) }
      it { should_not have_link('sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "sign out"}
        it { should have_link "sign in" }
      end
    end
  end
  describe "authorization" do

    describe "for non-signed-in users" do
    let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "email",    with: user.email
          fill_in "password", with: user.password
          click_button "sign in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            expect(page).to have_title('edit user')
          end 
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('sign in') }
        end
        describe "visiting the user index" do
          before { visit users_path }
          it { should have_title('sign in') }
        end
        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end
      describe "in the Cocktails controller" do

        describe "submitting to the create action" do
          before { post cocktails_path }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete cocktail_path(FactoryGirl.create(:cocktail)) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end

      describe "in the Ingredients controller" do
        describe "submitting to the create action" do
          before { post ingredients_path }
          specify { expect(response).to redirect_to(signin_path) }
        end
        describe "submitting to the destroy action" do
          before { delete ingredient_path(FactoryGirl.create(:ingredient)) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end
    end

    describe "as wrong user" do
      before { sign_in user, no_capybara: true }

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(full_title('edit user')) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
