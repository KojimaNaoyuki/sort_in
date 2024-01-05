# SortIn

This gem provides a method that allows you to sort and retrieve values in the order they were passed to the IN clause when the IN clause is issued from the where method of ActiveRecord.

## Language

- [Japanese]()
- [English]()

## Installation

Add sort_in to your project's Gemfile:

```
gem 'sort_in'
```

Then, execute the installation:

```
$ bundle
```

You can also install sort_in standalone:

```
$ gem install sort_in
```

## Usage

You can use it in a natural flow by using ActiveRecord methods and method chaining. In the example below, the filtering conditions of the where clause specify id: 3, 2, 1. In a regular where clause, an IN clause is issued, and the results are returned in ascending order of id, filtered by 3, 2, 1. By using the where_sort_in provided by this gem, you can not only filter by id 3, 2, 1 but also retrieve records in the order specified by the IN clause.

```
Post.where_sort_in(id: [3, 2, 1])
=> [#<Post:~~~ id: 3, ~~~>, #<Post:~~~ id: 2, ~~~>, #<Post:~~~ id: 1, ~~~>]
```

If you want to sort by a column other than id, use the keyword argument sort_key. You can specify the column to be used for sorting.

```
Post.where_sort_in(sort_key: :content, content: ['third', 'second', 'first'])
=> [#<Post:~~~ id: 3, content: 'third', ~~~>, #<Post:~~~ id: 2, content: 'second', ~~~>, #<Post:~~~ id: 1, content: 'first', ~~~>]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake ` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sort_in.
