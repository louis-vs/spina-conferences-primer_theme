# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Blog
        class ApplicationController < ::Spina::ApplicationController
          include ::Spina::Frontend
          def cookies_info
            render partial: 'cookies'
          end

          protected

          def theme_layout
            'layouts/spina/conferences/primer_theme/blog/blog'
          end
        end
      end
    end
  end
end
