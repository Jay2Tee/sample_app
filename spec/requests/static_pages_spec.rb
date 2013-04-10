require 'spec_helper'

describe "Static pages" do
  include Capybara::DSL

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    content: 'Welcome to Jamitter') }
    it { should have_selector('title', content: full_title('')) }
    it { should_not have_selector 'title', content: '| Home' }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", content: item.content)
        end
      end
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    content: 'Help') }
    it { should have_selector('title', content: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    content: 'About') }
    it { should have_selector('title', content: full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    content: 'Contact') }
    it { should have_selector('title', content: full_title('Contact')) }
  end
end