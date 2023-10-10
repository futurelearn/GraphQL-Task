require 'test_helper'

class PublishCourseMutationTest < ActiveSupport::TestCase
  include ActionDispatch::IntegrationTest::Behavior

  test 'publishes a course' do
    course = courses(:unpublished_course)
    assert_not course.published

    query = <<~GQL
      mutation {
         publishCourse(input: { courseId: "#{course.id}" }) {
          id
          published
        }
      }
    GQL

    post '/graphql', params: { query: query }, as: :json
    assert_response :success

    course.reload
    assert course.published
  end
end
