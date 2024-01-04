require'pry'

module SortIn
  module ModelExtension
    extend ActiveSupport::Concern

    module ClassMethods
      def where_sort_in(sort_key: nil, **args)
        targets = where(args)
        sort_in(targets: targets, args: args, sort_key: sort_key)
      end

      private

      def sort_in(targets:, args:, sort_key:)
        unless sort_key
          sorted_targets = args[:id].map do |id|
            targets.find { |sort_target| sort_target.id.to_i == id.to_i }
          end

          return sorted_targets.compact
        end

        sorted_targets = args[sort_key].map do |value|
          targets.find { |sort_target| sort_target[sort_key] == value }
        end

        return sorted_targets.compact
      end
    end
  end
end