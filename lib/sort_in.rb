# frozen_string_literal: true
require 'active_record'
require_relative "sort_in/version"

module SortIn
  class Error < StandardError; end
  # Your code goes here...
end

ActiveSupport.on_load(:active_record) do
  require 'sort_in/extension'
  ActiveRecord::Base.send(:include, SortIn::Extension)
end
