# frozen_string_literal: true

module Types
  module Inputs
    class CourseFilters < Types::BaseInputObject
      argument :published, Boolean, required: false
    end
  end
end
