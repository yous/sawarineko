# Sawarineko

[![Gem Version](https://badge.fury.io/rb/sawarineko.svg)](http://badge.fury.io/rb/sawarineko)
[![Build Status](https://travis-ci.org/yous/sawarineko.svg?branch=master)](https://travis-ci.org/yous/sawarineko)
[![Dependency Status](https://gemnasium.com/yous/sawarineko.svg)](https://gemnasium.com/yous/sawarineko)
[![Code Climate](https://codeclimate.com/github/yous/sawarineko/badges/gpa.svg)](https://codeclimate.com/github/yous/sawarineko)
[![Coverage Status](https://img.shields.io/coveralls/yous/sawarineko.svg)](https://coveralls.io/r/yous/sawarineko?branch=master)
[![Inline docs](http://inch-ci.org/github/yous/sawarineko.svg?branch=master)](http://inch-ci.org/github/yous/sawarineko)
[![sawarineko API Documentation](https://www.omniref.com/ruby/gems/sawarineko.png)](https://www.omniref.com/ruby/gems/sawarineko)

> ななめななじゅうななどのならびでなくなくいななくななはんななだいなんなくならべてながながめ

Get your Nya!

## Installation

``` sh
gem install sawarineko
```

Or add this line to your application's Gemfile:

``` ruby
gem 'sawarineko'
```

## Usage

Just get your Nya with Sawarineko:

``` ruby
Sawarineko.nya('ばなな')
# => "ばにゃにゃ"

Sawarineko.nya('バナナ')
# => "バニャニャ"

Sawarineko.nya('바나나')
# => "바냐냐"
```

Run `sawarineko` with no arguments to pass texts through terminal input.

``` sh
sawarineko
```

Or pass `sawarineko` a file to convert like `sawarineko README.md | head -3`:

``` sh
sawarineko something.txt
```

For additional command-line options:

``` sh
sawarineko -h
```

Command flag              | Description
--------------------------|-------------------------------
`-e, --encoding ENCODING` | Specify the encoding of input.
`-h, --help`              | Print this message.
`-v, --version`           | Print version.

## Contributing

1. Fork it (https://github.com/yous/sawarineko/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## License

Copyright (c) ChaYoung You. See [LICENSE.txt](LICENSE.txt) for further details.
