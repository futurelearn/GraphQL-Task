# frozen_string_literal: true

module Queries
  class Courses < GraphQL::Schema::Resolver
    type [Types::CourseType], null: false

    argument :filters, Types::Inputs::CourseFilters, required: false

    def resolve(filters: {})
      ::Courses::CoursesQueryService.new(filters: filters).call
    end
  end
end
