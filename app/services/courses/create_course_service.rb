# frozen_string_literal: true

module Courses
  class CreateCourseService
    def initialize(arguments)
      @title = arguments[:title]
      @description = arguments[:description]
      @published = arguments[:published]
      @collections = arguments[:collections]
    end

    def call
      course = Course.new(title: @title, description: @description, published: @published)
      course.collections << Collection.where(id: @collections) if @collections
      course.save!
      course
    end
  end
end
