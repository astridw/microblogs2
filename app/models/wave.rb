class Wave < ActiveRecord::Base
  belongs_to :user
  validates :post, presence: true, length: {maximum: 150, minimum: 5}
end
