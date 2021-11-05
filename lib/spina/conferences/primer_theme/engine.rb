# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      class Engine < ::Rails::Engine
        # isolate_namespace Spina::Conferences::PrimerTheme

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
