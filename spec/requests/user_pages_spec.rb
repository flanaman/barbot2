require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    it { should have_title('all users') }
    it { should have_content('all users') }

    # describe "pagination" do

    #   before(:all) { 30.times { FactoryGirl.create(:user) } }
    #   after(:all)  { User.delete_all }

    #   it { should have_selector('div.pagination') }

    #   it "should list each user" do
    #     User.paginate(page: 1).each do |user|
    #       expect(page).to have_selector('li', text: user.name)
    #     end
    #   end
    # end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:c1) { FactoryGirl.create(:cocktail, user: user, name: "Foo") }
    let!(:c2) { FactoryGirl.create(:cocktail, user: user, name: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "cocktails" do
      it { should have_content(c1.name) }
      it { should have_content(c2.name) }
      # it { should have_content(user.cocktails.count) }
    end
  end

  describe "signup page" do

    before { visit signup_path }

    let(:submit) { "create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "name",         with: "Example User"
        fill_in "email",        with: "user@example.com"
        fill_in "password",     with: "foobar"
        fill_in "confirm password", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving user" do
      	before { click_button submit }
      	let(:user) { User.find_by(email: 'user@example.com') }

      	it { should have_link('sign out') }
      	it { should have_title(full_title(user.name)) }
        it { should have_selector('div.alert.alert-success', text: 'welcome') }
      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "name",             with: new_name
        fill_in "email",            with: new_email
        fill_in "password",         with: user.password
        fill_in "confirm password", with: user.password
        click_button "save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end