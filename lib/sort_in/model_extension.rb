require'pry'

module SortIn
  module ModelExtension
    extend ActiveSupport::Concern

    module ClassMethods
      def sort_in
        sort_target = all
        # TODO: in句で指定した条件をどこかしらから取得してsort_targetを並び替える
        binding.pry
        'aaa'
      end
    end
  end
end