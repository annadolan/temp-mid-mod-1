require 'rails_helper'

describe 'A user visits the links index' do

  it "and clicks edit on a link" do
    user = create(:user)
    read_link = create(:read_link)
    link1 = create(:link, user: user, title: "One")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_button "Edit"

    expect(current_path).to eq(edit_link_path(link1))

  end

  it "and edits a link" do
    user = create(:user)
    read_link = create(:read_link)
    link1 = create(:link, user: user, title: "One", url: "http://www.tuing.io")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link1)

    fill_in "Title", with: "Two"

    click_on "Submit Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Two")
    expect(page).to_not have_content("One")
  end

  it 'and enters an invalid url' do
    user = create(:user)
    read_link = create(:read_link)
    link1 = create(:link, user: user, title: "One", url: "http://www.tuing.io")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_link_path(link1)

    fill_in "Url", with: "htp://www.turing.io"
    fill_in "Title", with: "Trking SCl of Spoofware and dumb"

    click_on "Submit Link"

    expect(page).to have_content("Your link did not update. Please make sure you enter a valid URL.")
    expect(page).to have_content("Edit link")

  end
end
