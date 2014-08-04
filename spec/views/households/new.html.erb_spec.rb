require 'rails_helper'

RSpec.describe "households/new", :type => :view do
  before(:each) do
    assign(:household, Household.new(
      :address => "MyString",
      :key_info => "MyString"
    ))
  end

  it "renders new household form" do
    render

    assert_select "form[action=?][method=?]", households_path, "post" do

      assert_select "input#household_address[name=?]", "household[address]"

      assert_select "input#household_key_info[name=?]", "household[key_info]"
    end
  end
end
