require 'rails_helper'

RSpec.describe "households/edit", :type => :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :address => "MyString",
      :key_info => "MyString"
    ))
  end

  it "renders the edit household form" do
    render

    assert_select "form[action=?][method=?]", household_path(@household), "post" do

      assert_select "input#household_address[name=?]", "household[address]"

      assert_select "input#household_key_info[name=?]", "household[key_info]"
    end
  end
end
