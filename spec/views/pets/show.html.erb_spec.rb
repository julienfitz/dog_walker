require 'rails_helper'

RSpec.describe "pets/show", :type => :view do
  before(:each) do
    @pet = assign(:pet, Pet.create!(
      :type => "Type",
      :name => "Name",
      :photo => "Photo",
      :size => "Size",
      :household_id => 1,
      :allergies => "Allergies",
      :vet_id => 2,
      :age => "Age",
      :feeding => "Feeding",
      :notes => "Notes",
      :behavior_id => 3,
      :supply_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Allergies/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Feeding/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
