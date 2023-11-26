module SortIn
  module ModelExtension
    extend ActiveSupport::Concern

    module ClassMethods
      def sort_in
        print('aaa')
      end
    end
  end
end