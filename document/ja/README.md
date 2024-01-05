# SortIn

ActiveRecord の where メソッドから IN 句が発行された場合、その IN 句に渡された順番で値がソートされ取得することができるメソッドを提供します。

## Language

- [Japanese](https://github.com/KojimaNaoyuki/sort_in/tree/master/document/ja)
- [English](https://github.com/KojimaNaoyuki/sort_in/tree/master/document/en)

## Installation

使用したいプロジェクトの Gemfile に sort_in を記載してください。

```ruby
gem 'sort_in'
```

インストールを実行してください。

```
$ bundle
```

単体で sort_in をインストールすることもできます。

```
$ gem install sort_in
```

## Usage

ActiveRecord のメソッドとメソッドチェインをすることで自然な流れで使用することができます。
下記の例では where 句の絞り込み条件に id: 3, 2, 1 を指定しています。通常の where 句では IN 句が発行され id の 3, 2, 1 で絞られた状態で id の昇順で返却されます。
この gem が提供する`where_sort_in`を使用することで、id の 3, 2, 1 で絞ると共に、レコードを取得する順番も IN 句で指定した通りの順番で取得することができます。

```ruby
Post.where_sort_in(id: [3, 2, 1])
=> [#<Post:~~~ id: 3, ~~~>, #<Post:~~~ id: 2, ~~~>, #<Post:~~~ id: 1, ~~~>]
```

id 以外でソートしたい場合は、キーワード引数(sort_key)を利用してください。
sort_key に指定したカラムを利用して並び替えられます。

```ruby
Post.where_sort_in(sort_key: :content, content: ['third', 'second', 'first'])
=> [#<Post:~~~ id: 3, content: 'third', ~~~>, #<Post:~~~ id: 2, content: 'second', ~~~>, #<Post:~~~ id: 1, content: 'first', ~~~>]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake ` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sort_in.
