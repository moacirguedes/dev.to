module Search
  class Cluster
    SEARCH_CLASSES = [Tag].freeze

    class << self
      def recreate_indexes
        destroy_indexes
        setup_indexes
      end

      def setup_indexes
        create_indexes
        add_aliases
        update_mappings
      end

      def create_indexes
        SEARCH_CLASSES.each do |search_class|
          next if SearchClient.indices.exists(index: search_class::INDEX_NAME)

          search_class.create_index
        end
      end

      def add_aliases
        SEARCH_CLASSES.each(&:add_alias)
      end

      def update_mappings
        SEARCH_CLASSES.each(&:update_mappings)
      end

      def destroy_indexes
        SEARCH_CLASSES.each(&:delete_index)
      end
    end
  end
end
