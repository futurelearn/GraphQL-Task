class Course < ApplicationRecord
  has_and_belongs_to_many :collections, join_table: :collection_memberships
end
