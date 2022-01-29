# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Blog
        # Base class from which controllers related to the blog plugin inherit
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
