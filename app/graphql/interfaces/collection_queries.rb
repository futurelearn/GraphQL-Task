# frozen_string_literal: true

module Interfaces
  module CollectionQueries
    include Types::BaseInterface

    field :collections, resolver: Queries::Collections
  end
end
