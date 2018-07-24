require "rails_helper"

RSpec.feature "Sign up", :type => :feature do
  before do
    MembershipCode.create!(code: 'ABCD')
  end

  scenario "User signs up successfully" do
    visit "/"
    click_link "Click here to join"
    fill_in "First name", :with => "James"
    fill_in "Last name", :with => "Darling"
    fill_in "Email", :with => "james@test.com"
    click_button "Create Membership"

    expect(page).to have_text("Success.")
    expect(Member.last.first_name).to eq('James')
    expect(Member.last.last_name).to eq('Darling')
    expect(Member.last.email).to eq('james@test.com')
  end

  scenario "User signs up unsuccessfully" do
    visit "/"
    click_link "Click here to join"
    click_button "Create Membership"

    expect(page).to have_text("can't be blank")
  end
end
