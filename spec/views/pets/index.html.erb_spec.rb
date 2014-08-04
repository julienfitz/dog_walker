require 'rails_helper'

RSpec.describe "pets/index", :type => :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
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
      ),
      Pet.create!(
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
      )
    ])
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Allergies".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Feeding".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
