module Types
  class CollectionType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :image_path, String, null: true
    field :published, Boolean, null: false
    field :courses, [CourseType], null: true
    field :largest_discount_percentage, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end

  def courses
    object.courses
  end

  def largest_discount_percentage
    object.largest_discount_percentage
  end
end
