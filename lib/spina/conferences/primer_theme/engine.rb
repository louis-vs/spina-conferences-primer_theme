# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      # Registers the frontend controller and page parts with Spina.
      class Engine < ::Rails::Engine
        config.after_initialize do
          Spina::Part.register(Spina::Parts::Conferences::PrimerTheme::Checkbox)
        end

        config.to_prepare do
          ::Spina::PagesController.helper 'spina/conferences/primer_theme/application'
        end
      end
    end
  end
end
