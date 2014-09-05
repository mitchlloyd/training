require 'spec_helper'

feature "Purchasing an online course", js: true, vcr: true do
  # increase the capybara wait time to account for stripe
  before do
    @origional_wait_time = Capybara.default_wait_time
    Capybara.default_wait_time = 12
  end
  after { Capybara.default_wait_time = @origional_wait_time }

  let(:registration_page) { RegistrationPage.new }
  let(:course) { FactoryGirl.create(:course, online: true, price: 200) }
  let(:last_registration) { TrainingApp::Registration.last }

  describe "without a discount code" do
    scenario do
      registration_page.visit_page(course)
      eventually { expect(registration_page.regular_price).to eq(200) }

      registration_page.fill_in_personal_information
      registration_page.fill_in_credit_card_information
      registration_page.submit_form
      eventually { expect(registration_page).to be_successful }
      expect(last_registration.amount).to eq(200)
    end
  end

  describe "with a discount code" do
    let!(:discount_code) { FactoryGirl.create(:discount_code, code: "$100-code", price: 100) }

    scenario do
      registration_page.visit_page(course)
      expect(registration_page.regular_price).to eq(200)
      registration_page.apply_discount("$100-code")
      expect(registration_page.discounted_price).to eq(100)

      registration_page.fill_in_personal_information
      registration_page.fill_in_credit_card_information
      registration_page.submit_form
      expect(registration_page).to be_successful
      expect(last_registration.amount).to eq(100)
      expect(last_registration.discount_code).to_not be_nil
    end
  end

  describe "with a zero price discount code" do
    let!(:discount_code) { FactoryGirl.create(:discount_code, code: "free!", price: 0) }

    scenario do
      registration_page.visit_page(course)
      expect(registration_page.regular_price).to eq(200)

      registration_page.apply_discount("free!")
      expect(registration_page.discounted_price).to eq(0)
      expect(registration_page).to have_disabled_credit_card_fields

      registration_page.fill_in_personal_information
      registration_page.submit_form
      expect(registration_page).to be_successful
      expect(last_registration.amount).to eq(0)
      expect(last_registration.discount_code.code).to eq("free!")
    end
  end
end
