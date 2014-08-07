require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    assign(:review, Review.new(
      :content => "MyText",
      :rating => 1
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "textarea#review_content[name=?]", "review[content]"

      assert_select "input#review_rating[name=?]", "review[rating]"
    end
  end
end
