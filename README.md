# StatiStica

StatiStica adds statistical functions to Ruby.

## Functions

The following functions are currently provided:

### [Mean](http://www.stats.gla.ac.uk/steps/glossary/presenting_data.html#sampmean)

```ruby
mean = StatiStica::Mean.new([1,2,3])
mean.value                        # => 2.0

StatiStica::Mean.new(['1',2,3])   # =>  ArgumentError
StatiStica::Mean.new([])          # =>  ArgumentError
```

### [Standard Deviation](http://www.stats.gla.ac.uk/steps/glossary/presenting_data.html#standev)

```ruby
sd = StatiStica::StandardDeviation.new([2,4,4,4,5,5,7,9])
sd.value                                                  # => 2.0

StatiStica::StandardDeviation.new(['2',4,4,4,5,5,7,9])    # =>  ArgumentError
StatiStica::StandardDeviation.new([])                     # =>  ArgumentError
```

### [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression)


```ruby
lr = StatiStica::LinearRegression.new(dx: [1,2,3])
lr.slope                                                  # => 1.0
lr.offset                                                 # => 1.0
lr.fit                                                    # => [2,2,2]

lr = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6])

lr.slope                                                  # => 0.0
lr.offset                                                 # => 5.0
lr.fit                                                    # => [5,5,5]

StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4])  # =>  ArgumentError
                   
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
