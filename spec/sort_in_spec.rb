require './spec_helper'

RSpec.describe SortIn do
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end

  class Post < ApplicationRecord; end

  describe '.where_sort_in' do
    let!(:post_first) { Post.create(id: 1, title: 'first post', content: 'first') }
    let!(:post_second) { Post.create(id: 2, title: 'second post', content: 'second') }
    let!(:post_third) { Post.create(id: 3, title: 'third post', content: 'third') }

    context 'when sort key is not specified' do
      it 'get in order of id' do
        sorted_post = Post.where_sort_in(id: [3, 1, 2])
        expect(sorted_post[0].id).to eq post_third.id
        expect(sorted_post[1].id).to eq post_first.id
        expect(sorted_post[2].id).to eq post_second.id
      end

      context 'when a non-existing id is included in in' do
        it 'get in order of id' do
          sorted_post = Post.where_sort_in(id: [3, 1, 4, 2])
          expect(sorted_post[0].id).to eq post_third.id
          expect(sorted_post[1].id).to eq post_first.id
          expect(sorted_post[2].id).to eq post_second.id
        end
      end
    end

    context 'when sort key is specified' do
      it 'get in order of specified key' do
        sorted_post = Post.where_sort_in(sort_key: :content, content: ['third', 'second', 'first'])
        expect(sorted_post[0].id).to eq post_third.id
        expect(sorted_post[1].id).to eq post_second.id
        expect(sorted_post[2].id).to eq post_first.id
      end

      context 'when a non-existing id is included in in' do
        it 'get in order of specified key' do
          sorted_post = Post.where_sort_in(sort_key: :content, content: ['third', 'second', 'hoge', 'first'])
          expect(sorted_post[0].id).to eq post_third.id
          expect(sorted_post[1].id).to eq post_second.id
          expect(sorted_post[2].id).to eq post_first.id
        end
      end
    end
  end
end