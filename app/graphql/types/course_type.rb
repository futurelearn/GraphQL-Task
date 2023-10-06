# frozen_string_literal: true

module Types
  class CourseType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String
    field :published, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :discount, Integer, null: false

    def discount
      object.collections&.map(&:discount)&.map {|discount| discount&.amount.to_i }.max.to_i
    end
  end
end
