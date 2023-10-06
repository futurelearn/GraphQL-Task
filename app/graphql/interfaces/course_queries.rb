# frozen_string_literal: true

module Interfaces
  module CourseQueries
    include Types::BaseInterface

    field :courses, resolver: Queries::Courses
  end
end
