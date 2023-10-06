# frozen_string_literal: true

module Interfaces
  module CourseMutations
    include Types::BaseInterface

    field :create_course, mutation: Mutations::CreateCourse
  end
end
