require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApiController).to receive(:current_user).and_return(user)

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end


  end
  scenario 'invalid url' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApiController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "URL:", with: "htp://www.turing.io"
    fill_in "Title:", with: "Trking SCl of Spoofware and dumb"

    click_on "Add Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Url is not a valid URL")

  end

  scenario 'url that already exists' do
    user = create(:user)
    link = create(:link, url: "http://www.turing.io")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApiController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "URL:", with: "http://www.turing.io"
    fill_in "Title:", with: "Turing School of Software and Design"

    click_on "Add Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Url has already been taken")

  end
end
