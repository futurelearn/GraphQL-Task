module Mutations
  class PublishCourseMutation < BaseMutation
    argument :course_id, ID, required: true
    type Types::CourseType

    def resolve(course_id:)
      course = Course.find(course_id)
      course.update(published: true)
      course
    end
  end
end
