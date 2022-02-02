# PrimerTheme for Spina

PrimerTheme is a theme for Spina that uses [GitHub's Primer design system](https://primer.style/). It provides frontends for Spina pages, as well as for the following Spina plugins:

- [Conferences](https://github.com/louis-vs/spina-admin-conferences-fork/)
- [Journal](https://github.com/louis-vs/spina-admin-journal)
- [Blog (fork)](https://github.com/louis-vs/spina-admin-conferences-blog)

All of these plugins will be automatically installed with PrimerTheme, but you can use any selection of them that you wish. PrimerTheme provides you with an easy-to-setup Spina theme with a wide array of options, extending the core Spina setup.

PrimerTheme was originally designed for the Undergraduate Linguistics Association of Britain's website, which you can [view here](https://www.ulab.org.uk/) if you want to see the theme in action.

**NB:** Please use this fork, rather than the original. This fork provides a stable, updated release, whilst the old repo is no longer maintained.

![Rails tests](https://github.com/louis-vs/spina-conferences-primer_theme-fork/workflows/Verify/badge.svg?branch=master&event=push)
[![codecov](https://codecov.io/gh/louis-vs/spina-conferences-primer_theme-fork/branch/master/graph/badge.svg?token=9TZ9QGGLAH)](https://codecov.io/gh/louis-vs/spina-conferences-primer_theme-fork)
[![CodeFactor](https://www.codefactor.io/repository/github/louis-vs/spina-conferences-primer_theme-fork/badge)](https://www.codefactor.io/repository/github/louis-vs/spina-conferences-primer_theme-fork)
[![Inline docs](http://inch-ci.org/github/louis-vs/spina-conferences-primer_theme-fork.svg?branch=master)](http://inch-ci.org/github/louis-vs/spina-conferences-primer_theme-fork)

## Features

The plugin's main goal is to provide frontends for Spina core and the three plugins listed above, using Primer. It also provides a number of useful page templates for use with Spina.

## Usage

See the READMEs for the conference plugin, the journal plugin, and the blog plugin, respectively, for more information on what kind of content this frontend allows you to create and how to do so within the admin interface.

You can customise Primer by overriding the `_custom.sass` and `_custom_variables.sass` files. See the [ULAB Website](https://github.com/ulab-committee/ulab-website) repo for an example.

## Installation

Make sure you have a working installation of Ruby on Rails 7. You can find a setup guide [here](https://guides.rubyonrails.org/getting_started.html).

You then need to install Spina, following the guide [on the Spina website](https://spinacms.com/docs).

To install the plugin, add this line to your application's Gemfile:

```ruby
gem 'spina-conferences-primer_theme-fork', require: 'spina/conferences/primer_theme'
```

And then execute:
```bash
$ bundle
```

You will also need to configure Yarn. Add this repo as a dependency, so that your `package.json` resembles the following:

```json
{
  "name": "website_name",
  "private": true,
  "dependencies": {
    "spina-conferences-primer-theme-fork": "louis-vs/spina-conferences-primer_theme-fork"
  }
}
```

You will then need to install and run the migrations from all of the plugins that come bundled with PrimerTheme:

```bash
$ bin/rails spina_admin_journal:install:migrations
$ bin/rails spina_admin_conferences:install:migrations
$ bin/rails spina_admin_conferences_blog:install:migrations
$ bin/rails spina_conferences_primer_theme:install:migrations
$ bin/rails db:migrate
```

Also make sure to ensure compilation of the assets for this gem by adding the following line to your `manifest.js` file.

```js
//= link spina_conferences_primer_theme_manifest.js
```

Finally, start the server with:

```bash
$ bin/rails s
```

If you want to customise Primer, you will need to add `_custom.sass` and/or `_custom_variables.sass` into `app/assets/stylesheets/spina/conferences/primer_theme`. You will also need to override the CSS build rake task so that it finds your new files - an example of this can be found in the ULAB website [here](https://github.com/ulab-committee/ulab-website/blob/master/lib/tasks/ulab_website_tasks.rake).

## Contributing

Bug reports and feature requests are welcome in the [Issues](https://github.com/louis-vs/spina-conferences-primer_theme-fork/issues) section. Translations are also very welcome!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
