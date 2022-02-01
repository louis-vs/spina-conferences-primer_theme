# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        # Base class from which controllers related to the journal plugin inherit
        class ApplicationController < Spina::ApplicationController
          before_action :journal_accessible?

          private

          def page
            @page ||= Spina::Page.find_or_create_by name: 'journal' do |page|
              page.title = 'Journal'
              page.link_url = '/journal/issues'
              page.deletable = false
            end
          end

          def journal_accessible?
            raise ActiveRecord::RecordNotFound unless current_spina_user.present? || page.live?
          end
        end
      end
    end
  end
end
