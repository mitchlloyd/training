class RegistrationPage
  include Capybara::DSL

  def visit_page(course, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{course.id}/register"
  end

  def submit_form(options = {})
    click_button "Register"
  end

  def fill_in_personal_information
    fill_in "Name", with: "Bob Jones"
    fill_in "email", with: "bobjones@example.com"
  end

  def fill_in_credit_card_information
    fill_in "Name on Card", with: "Bob Jones"
    fill_in "Card Number", with: "4242 4242 4242 4242"
    fill_in "Expiration Month (MM)", with: "04"
    fill_in "Expiration Year (YYYY)", with: "2015"
    fill_in "CVC", with: "222"
  end

  def apply_discount(code)
    fill_in 'Discount Code', with: code
  end

  def regular_price
    find('.price--regular').text.to_i
  end

  def discounted_price
    find('.price--discounted').text.to_i
  end

  def successful?
    page.has_content?("Thanks for purchasing")
  end

  def has_disabled_credit_card_fields?
    ["cc-name", "cc-number", "cc-cvc", "cc-month", "cc-year"].all? { |field|
      find("##{field}")[:disabled]
    }
  end
end

