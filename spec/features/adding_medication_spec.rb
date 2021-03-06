require "spec_helper"
require "rails_helper"

describe "user adds a new medication" do
  let!(:user) { FactoryGirl.create(:user1) }
  before do
    login_as user
    visit new_medication_path
  end

  it "creates a new medication" do
    fill_in "Name", with: "A medication name"
    fill_in "medication_comments", with: "A comment"
    fill_in "Strength", with: 100
    fill_in "Total", with: 30
    fill_in "Dosage", with: 2
    fill_in "Refill", with: "05/25/2016"
    click_on "Create Medication"
    expect(page).to have_content("A medication name")
    new_medication = user.medications.last
    expect(new_medication.name).to eq("A medication name")
  end
end
