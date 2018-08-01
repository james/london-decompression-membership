require "rails_helper"

RSpec.feature "Finding a membership", :type => :feature do
  before do
    MembershipCode.create!(code: 'ABCD')
    Member.create!(first_name: 'James', last_name: 'Darling', email: 'james@test.com')
  end

  scenario "User finds membership email" do
    visit "/"
    click_link "Check your membership"
    fill_in "Email", :with => "james@test.com"
    click_button "Find"

    expect(page).to have_text("If you are a member with this address you will receive")

    open_email('james@test.com')
    expect(current_email).to have_content 'Someone just requested'
    expect(current_email).to have_content 'ABCD'
  end

  scenario "User signs up unsuccessfully" do
    visit "/"
    click_link "Check your membership"
    fill_in "Email", :with => "james@test2.com"
    click_button "Find"

    expect(page).to have_text("If you are a member with this address you will receive")

    open_email('james@test2.com')
    expect(current_email).to be_nil
  end
end
