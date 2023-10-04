# README

## Setup

Ensure you running Ruby 2.7.7 and have the bundler gem.

To install the gems run:

`bundle install`

To setup the database:

`rails db:setup`

To run the application:

`bundle exec rails server`

Once running the website will be available at http://localhost:3000

## Task

This project contains a simple e-commerce site for promoting courses that
learners may be interested in. There is currently a GraphQL API for retrieving
a list of courses. This API is going to be used in a front-end application and
there are additional requirements that need to be satisfied.

A Collection model has been added to the project. Collections are used for
grouping courses together, either because they need to be displayed together,
or because they have the same discount.

The list below are the additional changes that are required. Add each item as a
separate commit so overall you will have a pull request with 5 commits. Details
of the code changes should be documented in each commit message, including:

* why did you make that change?
* what drove you to make certain decisions?
* what other options did you try?

Let us know when you have created the pull request.

1. Extend the courses API to accept a 'published' argument that controls
   whether or not published courses are returned.

2. Add a GraphQL API for returning collections along with their associated
   courses.

3. The consumer of the API now needs to know something specific: whether a
   given course is a member of a collection or not. Extend the API to allow the
   consumer to determine whether a given course, referenced by its ID, belongs
   to a particular collection.

4. Now there is a need to display the percentage discount alongside the
   courses. As a course could have multiple discounts, ensure that the largest
   possible discount is returned for each course.

5. Now there is a requirement to publish courses via the API. Implement a
   GraphQL mutation to accomplish this.

