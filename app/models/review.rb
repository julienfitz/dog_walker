class Review < ActiveRecord::Base
  belongs_to :walker, class_name: "User"
  belongs_to :owner, class_name: "User"
  validates_presence_of :content, :rating
  
end
