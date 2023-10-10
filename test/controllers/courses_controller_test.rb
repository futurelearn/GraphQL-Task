require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index with all courses" do
    get courses_url
    assert_response :success
    assert_equal Course.count, JSON.parse(response.body).size
  end

  test "should get index with published param as true" do
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: false } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: false } }
    get courses_url, params: { published: true }
    assert_response :success
    assert_equal Course.where(published: true).count, JSON.parse(response.body).size
  end

  test "should get index with published param as false" do
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: true } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: false } }
    post courses_url, params: { course: { description: @course.description, title: @course.title, published: false } }
    get courses_url, params: { published: false }
    assert_response :success
    assert_equal Course.where(published: false).count, JSON.parse(response.body).size
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { description: @course.description, published: @course.published, title: @course.title } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { description: @course.description, published: @course.published, title: @course.title } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end

  test "should check if course belongs to a collection" do
    collection = collections(:one)
    course = courses(:one)
    collection.courses << course

    get check_membership_path(collection, course), as: :json
    assert_response :success

    assert_equal({ "belongs_to_collection" => true }, JSON.parse(response.body))
  end

  test "should check if course belongs to a collection and return false" do
    collection = collections(:one)
    course = courses(:one)

    get check_membership_path(collection, course), as: :json
    assert_response :success

    assert_equal({ "belongs_to_collection" => false }, JSON.parse(response.body))
  end
end
