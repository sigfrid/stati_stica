# StatiStica

StatiStica adds statistical functions to Ruby.

## Functions

The following functions are currently provided:

### [Mean](http://www.stats.gla.ac.uk/steps/glossary/presenting_data.html#sampmean)

```ruby
mean = StatiStica::Mean.new([1,2,3])
mean.value                                # => 2.0

mean = StatiStica::Mean.new(['1',2,3])    # =>  ArgumentError
mean = StatiStica::Mean.new([])           # =>  ArgumentError
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stati_stica'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stati_stica

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stati_stica/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
