# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      # Base helper
      module ApplicationHelper
        include Spina::PagesHelper

        # Because the upper bound is exclusive a conference is current the day after it ends
        def current_conference
          Spina::Admin::Conferences::Conference.order(dates: :asc).find_by('upper(dates) >= ?', Time.zone.today)
        end

        def ancestors
          return [] if current_page.blank?

          render Primer::Beta::Breadcrumbs.new(mb: 4) do |component|
            current_page.ancestors.each do |ancestor|
              component.item(href: ancestor.materialized_path) { ancestor.menu_title }
            end
            component.item(href: current_page.materialized_path) { current_page.menu_title }
          end
        end

        def calendar(name:, &block)
          Icalendar::Calendar.new
                             .tap { |calendar| calendar.x_wr_calname = name }
                             .tap(&block)
                             .tap(&:publish)
                             .then(&:to_ical)
        end

        def generate_datetime(date, time)
          Time.zone.local(date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.min)
        end
      end
    end
  end
end
