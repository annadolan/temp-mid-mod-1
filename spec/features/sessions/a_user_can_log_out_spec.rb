require 'rails_helper'

describe "A logged-in user visits the index page" do
  it "and successfully logs out" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Log Out"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("You are logged out. See you later!")
  end
end
