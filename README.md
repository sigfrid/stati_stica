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

StatiStica::StandardDeviation.new(['2x',4,4,4,5,5,7,9])   # =>  ArgumentError
StatiStica::StandardDeviation.new([])                     # =>  ArgumentError
```

### Two D Standard Deviation
```ruby
sd = StatiStica::TwoDStandardDeviation.new(dx: [1,3,2], dy: [4,5,6])
sd.value                                                            # => 3.1091263510296048

StatiStica::TwoDStandardDeviation.new(dx: [1,2], dy: [4,5,6])       # =>  ArgumentError
StatiStica::TwoDStandardDeviation.new(dx: ['1x',3,2], dy: [4,5,6])  # =>  ArgumentError
```

### [Coefficient Of Determination](http://en.wikipedia.org/wiki/Coefficient_of_determination)
```ruby
r2 = StatiStica::CoefficientOfDetermination.new(dx: [1,3,2], dy: [4,5,6])
r2.value                                                                  # => 14.5

r2 = StatiStica::CoefficientOfDetermination.new(dx: [1,3,2], dy: [4,4,4])
r2.value                                                                  # => 1

StatiStica::CoefficientOfDetermination.new(dx: [1,2], dy: [4,5,6])        # =>  ArgumentError
StatiStica::CoefficientOfDetermination.new(dx: ['1x',3,2], dy: [4,5,6])   # =>  ArgumentError
```

### [Linear Regression](http://en.wikipedia.org/wiki/Linear_regression)
```ruby
lr = StatiStica::LinearRegression.new(dx: [1,2,3])
lr.slope                                                  # => 1.0
lr.offset                                                 # => 1.0
lr.fit                                                    # => [2,2,2]

lr = StatiStica::LinearRegression.new(dx: [1,3,2], dy: [4,5,6])
lr.slope                                                          # => 0.0
lr.offset                                                         # => 5.0
lr.fit                                                            # => [5,5,5]
lr.standard_error                                                 # => 1.414...

lr.lower_confidence_bound(2, 0.95)                                # => -5.374...
lr.lower_confidence_bound(2, 95)                                  # => -5.374...
lr.lower_confidence_bound([1,2,3], 95)                            # => [-11.404..., -5.374..., -11.404...]

lr.upper_confidence_bound(2, 95)                                  # => 15.374...
lr.upper_confidence_bound([1,2,3], 95)                            # => [21.404..., 15.374..., 21.404...]

lr.confidence_bounds(2, 95)                                       # => [-5.374..., 15.374...]
lr.confidence_bounds([1,2,3], 95)                                 # => [[-11.404..., 21.404...], [-5.374..., 15.374...], [-11.404..., 21.4040...]]]

StatiStica::LinearRegression.new(dx: [0,1,2], dy: [3,4])          # =>  ArgumentError

2el_series = StatiStica::LinearRegression.new(dx: [1,2], dy: [3,4])
2el_series.standard_error                                         # =>  ArgumentError
2el_series.confidence_bounds(2, 95)                               # =>  ArgumentError
2el_series.lower_confidence_bound(2, 95)                          # =>  ArgumentError
2el_series.upper_confidence_bound(2, 95)                          # =>  ArgumentError            
```

### [PCA::Cp](https://en.wikipedia.org/wiki/Process_capability_index)
```ruby
cp = StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: "2")
cp.value                                                # => 2.0

cp = StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: 0)
cp.value                                                # => Infinity

StatiStica::PCA::Cp.new(lsl: 0, usl: 24)                # =>  ArgumentError
StatiStica::PCA::Cp.new(lsl: 0, usl: 24, sd: "2x")      # =>  ArgumentError
```

### [PCA::Cpk](https://en.wikipedia.org/wiki/Process_capability_index)
```ruby
cp = StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: "2")
cp.value                                                          # => 1.5

cp = StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: 0)
cp.value                                                          # => Infinity

StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9)                # =>  ArgumentError
StatiStica::PCA::Cpk.new(lsl: 0, usl: 24, mean: 9, sd: "2x")      # =>  ArgumentError
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
