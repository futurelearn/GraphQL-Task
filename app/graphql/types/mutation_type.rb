# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :publishCourse, mutation: Mutations::PublishCourseMutation
  end
end
