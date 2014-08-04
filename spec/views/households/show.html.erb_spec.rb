require 'rails_helper'

RSpec.describe "households/show", :type => :view do
  before(:each) do
    @household = assign(:household, Household.create!(
      :address => "Address",
      :key_info => "Key Info"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Key Info/)
  end
end
