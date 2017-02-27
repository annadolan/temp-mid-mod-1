require "rails_helper"

describe "A user visits the login path" do
  it "and they successfully log in" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "You have successfully logged in!"
    expect(page).to have_content "Log Out"
  end

  it "and they enter an incorrect password" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "pw"
    fill_in "Password confirmation", with: "pw"
    click_on "Sign In"

    expect(page).to have_content "The password entered is incorrect."
  end

  it "and they leave a field empty" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "pw"
    click_on "Sign In"

    expect(page).to have_content "Please fill in all fields."
  end
end
