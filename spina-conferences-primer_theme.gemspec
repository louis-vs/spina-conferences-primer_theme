# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'spina/conferences/primer_theme/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = 'spina-conferences-primer_theme-fork'
  spec.version = Spina::Conferences::PrimerTheme::VERSION
  spec.required_ruby_version = '~> 2.7'
  spec.authors = ['Justin Malčić', 'Louis Van Steene']
  spec.email = ['j.malcic@me.com', 'louis@lvs.me.uk']
  spec.summary = 'Spina::Admin::Conferences frontend theme.'
  spec.description = 'Frontend for Spina::Admin::Conferences plugin, based on Primer.'
  spec.license = 'MIT'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'babel-transpiler', '~> 0.7'
  spec.add_dependency 'cssbundling-rails', '~> 1.0'
  spec.add_dependency 'icalendar', '~> 2.5'
  spec.add_dependency 'image_processing', '~> 1.9'
  spec.add_dependency 'primer_view_components', '0.0.87'
  spec.add_dependency 'rails', '~> 7.0'
  spec.add_dependency 'spina', '~> 2.8', '>= 2.8'
  spec.add_dependency 'spina-admin-conferences-blog', '0.3.1'
  spec.add_dependency 'spina-admin-conferences-fork', '3.0.0'
  spec.add_dependency 'spina-admin-journal', '~> 1.0'

  spec.add_development_dependency 'capybara', '~> 3.33'
  spec.add_development_dependency 'dotenv-rails', '~> 2.7'
  spec.add_development_dependency 'puma', '~> 5.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.8'
  spec.add_development_dependency 'rubocop-rails', '~> 2.8'
  spec.add_development_dependency 'selenium-webdriver', '~> 4.1'
  spec.add_development_dependency 'simplecov', '~> 0.19'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.8'
  spec.add_development_dependency 'web-console', '~> 4.0'
  spec.add_development_dependency 'webdrivers', '~> 5.0'
end
