require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "home page" do
    before { visit root_path }

    it { should have_content('barbot') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('help') }
    it { should have_title(full_title('help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('about') }
    it { should have_title(full_title('about barbot')) }
  end

end