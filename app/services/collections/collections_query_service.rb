# frozen_string_literal: true

module Collections
  class CollectionsQueryService
    def call
      collections
    end

    private

    def base_scope
      Collection.all
    end

    def collections
      base_scope
    end
  end
end
