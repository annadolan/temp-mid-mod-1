require 'rails_helper'

describe 'A user visits the links index' do
  it 'and creates a new link' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "Url", with: "http://www.turing.io"
    fill_in "Title", with: "Turing School of Software and Design"

    click_on "Submit Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Turing School")
    expect(page).to have_content("Your link has saved")
  end

  it 'and enters an invalid url' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    fill_in "Url", with: "htp://www.turing.io"
    fill_in "Title", with: "Trking SCl of Spoofware and dumb"

    click_on "Submit Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("The link submitted was invalid")

  end

  it 'and enters a url that already exists' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    fill_in "Url", with: "http://www.turing.io"
    fill_in "Title", with: "Turing School of Software and Design"

    click_on "Submit Link"

    fill_in "Url", with: "http://www.turing.io"
    fill_in "Title", with: "Turing School of Software and Design"

    click_on "Submit Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("The link submitted already exists")

  end
end
