# frozen_string_literal: true

require 'spina'
require 'spina/conferences/primer_theme/engine'
require 'spina/conferences/primer_theme/breadcrumbs/builder'
require 'spina/admin/conferences'
require 'spina/admin/journal'
require 'spina/admin/conferences/blog'
require 'view_component'
require 'primer/view_components'
require 'icalendar'
require 'cssbundling-rails'

module Spina
  module Conferences
    # A Primer-based frontend theme for Spina.
    module PrimerTheme
      include ActiveSupport::Configurable

      config_accessor :importmap

      self.importmap = Importmap::Map.new
    end
  end
end
