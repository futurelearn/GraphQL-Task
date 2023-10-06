# frozen_string_literal: true

module Mutations
  class CreateCourse < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :published, Boolean, required: true
    argument :collections, [ID], required: false

    type Types::CourseType, null: false

    def resolve(arguments = {})
      Courses::CreateCourseService.new(arguments).call
    end
  end
end
