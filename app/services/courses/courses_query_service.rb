# frozen_string_literal: true

module Courses
  class CoursesQueryService
    attr_reader :filters

    def initialize(filters:)
      @filters = filters
    end

    def call
      courses
    end

    private

    def base_scope
      Course.all
    end

    def courses
      courses = base_scope
      courses = courses.where(published: filters[:published]) if filters.key?(:published)
      courses
    end
  end
end
