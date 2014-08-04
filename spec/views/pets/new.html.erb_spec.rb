require 'rails_helper'

RSpec.describe "pets/new", :type => :view do
  before(:each) do
    assign(:pet, Pet.new(
      :type => "",
      :name => "MyString",
      :photo => "MyString",
      :size => "MyString",
      :household_id => 1,
      :allergies => "MyString",
      :vet_id => 1,
      :age => "MyString",
      :feeding => "MyString",
      :notes => "MyString",
      :behavior_id => 1,
      :supply_id => 1
    ))
  end

  it "renders new pet form" do
    render

    assert_select "form[action=?][method=?]", pets_path, "post" do

      assert_select "input#pet_type[name=?]", "pet[type]"

      assert_select "input#pet_name[name=?]", "pet[name]"

      assert_select "input#pet_photo[name=?]", "pet[photo]"

      assert_select "input#pet_size[name=?]", "pet[size]"

      assert_select "input#pet_household_id[name=?]", "pet[household_id]"

      assert_select "input#pet_allergies[name=?]", "pet[allergies]"

      assert_select "input#pet_vet_id[name=?]", "pet[vet_id]"

      assert_select "input#pet_age[name=?]", "pet[age]"

      assert_select "input#pet_feeding[name=?]", "pet[feeding]"

      assert_select "input#pet_notes[name=?]", "pet[notes]"

      assert_select "input#pet_behavior_id[name=?]", "pet[behavior_id]"

      assert_select "input#pet_supply_id[name=?]", "pet[supply_id]"
    end
  end
end
