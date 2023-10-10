class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @courses = filter_courses(Course.all)

    render json: @courses
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  def check_membership
    begin
      collection = Collection.find(params[:collection_id])
      course = Course.find(params[:course_id])

      belongs_to_collection = collection.courses.exists?(course.id)

      render json: { belongs_to_collection: belongs_to_collection }
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: 'Collection or course not found' }, status: :not_found
    rescue => e
      render json: { error: 'Unexpected error ' }, status: :internal_server_error
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description, :published)
    end

  def filter_courses(courses)
    if params[:published].present?
      courses.where(published: params[:published])
    else
      courses
    end
  end
end
