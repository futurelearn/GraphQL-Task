class Collection < ApplicationRecord
  has_and_belongs_to_many :courses, join_table: :collection_memberships
  has_one :discount

  def largest_discount_percentage
    return 0 unless discount

    discount.amount
  end
end
