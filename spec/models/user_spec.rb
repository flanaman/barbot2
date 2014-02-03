require 'spec_helper'

describe User do

	before do 
		@user = User.new(name: "name name", email: "mark@mark.mark", 
			password: "foobar", password_confirmation: "foobar")
	end

	subject {@user}

  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:cocktails) }


  describe "remember token" do
  	before { @user.save }
  	its(:remember_token) {should_not be_blank }
  end

  describe "cocktail associations" do

    before { @user.save }
    let!(:older_cocktail) do
      FactoryGirl.create(:cocktail, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_cocktail) do
      FactoryGirl.create(:cocktail, user: @user, created_at: 1.hour.ago)
    end

    # it "should have the right cocktails in the right order" do
    #   expect(@user.cocktails.to_a).to eq [newer_cocktail, older_cocktail]
    # end

    it "should destroy associated cocktails" do
      cocktails = @user.cocktails.to_a
      @user.destroy
      expect(cocktails).not_to be_empty
      cocktails.each do |cocktail|
        expect(Cocktail.where(id: cocktail.id)).to be_empty
      end
    end
  end
end
