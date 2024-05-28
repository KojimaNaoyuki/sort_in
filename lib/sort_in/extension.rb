require 'sort_in/model_extension'

module SortIn
  module Extension
    extend ActiveSupport::Concern

    module ClassMethods
      def inherited(kls)
        super
        kls.public_send(:include, SortIn::ModelExtension) if kls.superclass == ActiveRecord::Base
      end
    end
  end
end
