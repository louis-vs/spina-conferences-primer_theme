# frozen_string_literal: true

Spina::Conferences::PrimerTheme.config.importmap.draw do
  # Stimulus & Turbo, as included with spina
  pin '@hotwired/stimulus', to: 'stimulus.js'
  pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
  pin '@hotwired/turbo-rails', to: 'turbo.js'

  # GitHub Primer
  pin '@github/details-dialog-element', to: '@github/details-dialog-element/dist/index.js'
  pin '@github/include-fragment-element', to: '@github/include-fragment-element/dist/index.js'
  pin '@github/filter-input-element', to: '@github/filter-input-element/dist/index.js'
  pin '@github/details-menu-element', to: '@github/details-menu-element/dist/index.js'

  # Frontend entrypoint
  pin 'application', to: 'spina/conferences/primer_theme/application.js'

  pin_all_from Spina::Conferences::PrimerTheme::Engine.root.join('app/assets/javascripts/spina/conferences/primer_theme/controllers'), # rubocop:disable Layout/LineLength
               under: 'controllers',
               to: 'spina/conferences/primer_theme/controllers'
end
