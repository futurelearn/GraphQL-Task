# frozen_string_literal: true

module Queries
  class Collections < GraphQL::Schema::Resolver
    type [Types::CollectionType], null: false

    def resolve
      ::Collections::CollectionsQueryService.new.call
    end
  end
end
