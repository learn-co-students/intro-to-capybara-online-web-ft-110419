require 'spec_helper'
 
describe "GET '/' - Greeting Form" do 
  it 'welcomes the user' do 
    visit '/' # The visit method navigates the test's browser to a specific URL
    expect(page.body).to include("Welcome!") # The page.body method will dump out all of the HTML in the current page as a string.
  end
# Visit and page are two capybara methods.
# The page method in Capybara exposes the "session" or "browser" 
# that is conceptually (and literally) being used during the test. 
# The page method gives you a Capybara::Session object that represents 
# the browser page the user would actually be looking at if they 
# navigated to '/' (or whichever route was last passed to visit).

  it 'has a greeting form with a user_name field' do
    visit '/' # we tell Capybara to visit the page at '/'

    expect(page).to have_selector("form") # We can simply assert that the page has an HTML selector for form, meaning that the page contains an HTML element that matches the form tag.
    expect(page).to have_field(:user_name) # We're saying that we expect the page to have a form field called user_name
  end
end
  # Where does this magic have_selector matcher come from? 
  # That's right, Capybara has added that to RSpec.

describe "POST '/greet' - User Greeting" do
  it 'greets the user personally based on their user_name in the form' do
    visit '/'
   
    fill_in(:user_name, :with => "Avi") # Then we use the Capybara method fill_in to fill in the input field user_name with 'Avi'.
    click_button "Submit" # That HTML interaction, submitting a form, will trigger a new HTTP request in the Capybara session and page object.
   
    expect(page).to have_text("Hi Avi, nice to meet you!")
  end
end
# When a user submits a form, the browser loads a new page, and they see new content.