# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        # User-facing controller for journal issues
        class IssuesController < ApplicationController
          before_action :set_journal
          before_action :set_volume, :set_issue, only: :show
          before_action :set_metadata

          def index
            # having multiple journals is not currently allowed anyway
            @issues = if current_spina_user.present?
                        Admin::Journal::Issue.sorted_desc
                      else
                        Admin::Journal::Issue.sorted_desc.where('date <= ?', Time.zone.today)
                      end
            @latest_issue = @issues.first
          end

          def show
            @articles = current_spina_user.present? ? @issue.articles : @issue.articles.visible
            add_breadcrumb helpers.journal_abbreviation_or_name(@journal), frontend_issues_path
            add_breadcrumb t('spina.conferences.primer_theme.journal.volume_issue',
                             volume_number: @issue.volume.number, issue_number: @issue.number)
          end

          private

          def set_journal
            @journal = Admin::Journal::Journal.instance
          end

          def set_issue
            @issue = @volume.issues.includes(:volume, :articles).find_by!(number: params[:number])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_volume
            @volume = Admin::Journal::Volume.includes(:issues).find_by!(number: params[:volume_number])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_breadcrumb
            add_breadcrumb helpers.journal_abbreviation_or_name(@journal), frontend_issues_path
            # add_breadcrumb Admin::Journal::Issue.model_name.human.pluralize, frontend_issues_path
          end

          def set_metadata
            @title = @journal.name
            @description = ActionView::Base.full_sanitizer.sanitize(@journal.content(:description))
          end
        end
      end
    end
  end
end
