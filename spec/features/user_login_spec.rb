require "rails_helper"

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: "Apparel"

    @user = User.create!({
      first_name: "Test",
      last_name: "Tester",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password",
    })
  end

  scenario "Can login in" do

    # ACT
    visit root_path
    click_link "Login"
    find(".login-form")
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "password"
    click_on "Submit"
    find("li.logout")

    # DEBUG / VERIFY
    #save_screenshot
    expect(page).to have_css "li.logout", text: "Logout"
  end
end
