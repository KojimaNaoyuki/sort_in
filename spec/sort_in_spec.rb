require './spec_helper'

RSpec.describe SortIn do
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end

  class Post < ApplicationRecord; end

  describe '.sort_in' do
    it 'test' do
      expect(1 + 1).to eq 2
    end
  end
end