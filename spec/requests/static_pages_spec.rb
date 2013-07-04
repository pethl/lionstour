require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    
    it "should have the h1 '2013 Lions Tour'" do
          visit ' /home'
          page.should have_selector('h1', :text => '2013 Lions Tour')
        end

    it "should have the content '2013 Lions Tour'" do
      visit '/home'
      page.should have_content('2013 Lions Tour')
    end
  end
end

