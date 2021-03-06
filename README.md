# ImageComparable


Image comparable it's a gem inspired by [NAKAL](https://github.com/rajdeepv/nakal)

The principal idea is providing an easy way to develop your visual regression tests,
 Image Comparable 
 use [Chunky::PNG](https://github.com/wvanbergen/chunky_png) a pure ruby lib to read and write images.


# Features

Compare pixel by pixel and generate an image_diff with the modifications

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_comparable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_comparable

## Usage

Add in you gemfile

```
gem 'image_comparable'
```
In top level of you class

```
require 'image_comparable'
```
You must have two images to compare such as baseline and screenshoot to compare.
To execute the main method from ImageCompare follow the exemple bellow:

```
ImageComparable.execute(File.join('path/baseline.png'),File.join('path/screenshot.png'),1)
```

the first parameter is a path to you baseline image, second parameter is a path to you screenshot image,
 and the third parameter is a acceptant criteria, this parameter its a guide to ImageComparable,
 when the score difference is greater than acceptante criteria an error is raised



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/image_comparable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

