# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Conferences
        # Base class from which controllers inherit
        class ApplicationController < Spina::ApplicationController
          before_action :page

          def cookies_info
            render partial: 'cookies'
          end

          private

          def page
            @page ||= Spina::Page.find_or_create_by name: 'conferences' do |page|
              page.title = 'Conferences'
              page.link_url = '/conferences/conferences'
              page.deletable = false
              page.active = true
            end
          end
        end
      end
    end
  end
end
