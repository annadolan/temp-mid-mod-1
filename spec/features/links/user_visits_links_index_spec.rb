require 'rails_helper'

describe 'A user visits the links index' do
  it 'and sees a form to submit a link' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Create a new link")
  end

  it "and sees their own links only" do
    user = create(:user)
    user2 = create(:user)
    link1 = create(:link, user: user, title: "One")
    link2 = create(:link, user: user, title: "Two")
    link3 = create(:link, user: user2, title: "Three")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("One")
    expect(page).to have_content("Two")
    expect(page).to_not have_content("Three")
  end
end
