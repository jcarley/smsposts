require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have the right links on the layout" do
    # navigates to the home page using the named route
    visit root_path
    
    # tests the title for the home page
    response.should have_selector('title', :content => "Home")
    
    # navigate from the home page to the About page and test its title
    click_link "About"
    response.should have_selector('title', :content => "About")
    
    # navigate from the home page to the Contact page and test its title
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    
    # navigate from the home page to the Home page and test its title
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    
    # navigate from the home page to the Sign up now page and test its title
    click_link "Sign up now"
    response.should have_selector('title', :content => "Sign up")
    
    # tests that the home page has a link to the root path and has an image as its content
    response.should have_selector('a[href="/"]>img')
  end
  
end
