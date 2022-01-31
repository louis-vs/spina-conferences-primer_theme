# PrimerTheme: frontend for Spina

![Rails tests](https://github.com/louis-vs/spina-conferences-primer_theme-fork/workflows/Verify/badge.svg?branch=master&event=push)
[![codecov](https://codecov.io/gh/louis-vs/spina-conferences-primer_theme-fork/branch/master/graph/badge.svg?token=9TZ9QGGLAH)](https://codecov.io/gh/louis-vs/spina-conferences-primer_theme-fork)
[![CodeFactor](https://www.codefactor.io/repository/github/louis-vs/spina-conferences-primer_theme-fork/badge)](https://www.codefactor.io/repository/github/louis-vs/spina-conferences-primer_theme-fork)
[![Inline docs](http://inch-ci.org/github/louis-vs/spina-conferences-primer_theme-fork.svg?branch=master)](http://inch-ci.org/github/louis-vs/spina-conferences-primer_theme-fork)

A plugin for `Spina` that provides a frontend for `Spina::Admin::Conferences`, `Spina::Admin::Journal`, and `Spina::Admin::Conferences::Blog` using components from `Primer::ViewComponents`.

This fork provides an updated version of the plugin, as the main repo is currently badly outdated.

## Usage
See the READMEs for the conference plugin, the journal plugin, and the bog plugin, respectively, for more information on what kind of content this frontend allows you to create and how to do so within the admin interface. Also make sure to ensure compilation of the assets for this gem by adding the following line to your
`manifest.js` file.

```js
//= link spina_conferences_primer_theme_manifest.js
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'spina-conferences-primer_theme-fork', require: 'spina/conferences/primer_theme'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install spina-conferences-primer_theme-fork
```

The first thing you will probably want to do is add three pages using the 'blank' template, and add
forwarding URLs as follows:
* Conferences to `/conferences/conferences`
* Journal to `/journal/issues`
* Blog to `/blog`

## Contributing
Contributions welcome, open an issue first please.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
