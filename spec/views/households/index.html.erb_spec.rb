require 'rails_helper'

RSpec.describe "households/index", :type => :view do
  before(:each) do
    assign(:households, [
      Household.create!(
        :address => "Address",
        :key_info => "Key Info"
      ),
      Household.create!(
        :address => "Address",
        :key_info => "Key Info"
      )
    ])
  end

  it "renders a list of households" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Key Info".to_s, :count => 2
  end
end
