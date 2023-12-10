require './spec_helper'

RSpec.describe SortIn do
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end

  class Post < ApplicationRecord; end

  describe '.sort_in' do
    let!(:post_first) { Post.create(title: 'first post', content: 'test') }
    let!(:post_second) { Post.create(title: 'second post', content: 'hogehoge') }
    let!(:post_third) { Post.create(title: 'third post', content: 'hogehoge') }

    it 'test' do
      expect(Post.where(id: [3, 1, 2]).sort_in).to eq 'aaa'
    end
  end
end