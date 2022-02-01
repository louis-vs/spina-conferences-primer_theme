# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Blog
        # Base class from which controllers related to the blog plugin inherit
        class ApplicationController < ::Spina::ApplicationController
          include ::Spina::Frontend

          before_action :page

          def cookies_info
            render partial: 'cookies'
          end

          protected

          def theme_layout
            'layouts/spina/conferences/primer_theme/blog/blog'
          end

          def page
            @page = Spina::Page.find_or_create_by name: 'blog' do |page|
              page.title = 'Blog'
              page.link_url = '/blog'
              page.deletable = false
            end
          end
        end
      end
    end
  end
end
