# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        # User-facing controller for journal articles
        class ArticlesController < ApplicationController
          before_action :set_volume, :set_issue, :set_article, :set_journal, :set_licence, :set_breadcrumb, :set_metadata,
                        :require_admin_for_invisible_article

          def show
            respond_to do |format|
              format.html { add_breadcrumb @article.title }
              format.pdf do
                if @article.has_content?(:attachment)
                  redirect_to main_app.url_for(@article.content(:attachment))
                else
                  send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
                end
              end
            end
          end

          private

          def set_article
            @article = @issue.articles.includes(affiliations: [:institution]).find_by!(number: params[:number])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_issue
            @issue = @volume.issues.includes(:volume, :articles).find_by!(number: params[:issue_number])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_volume
            @volume = Admin::Journal::Volume.includes(:issues).find_by!(number: params[:volume_number])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_journal
            @journal = @issue.volume.journal
          end

          def set_licence
            @licence = @article.licence
          end

          def set_breadcrumb
            return if @issue.blank?

            add_breadcrumb helpers.journal_abbreviation_or_name(@journal), frontend_issues_path
            # add_breadcrumb Admin::Journal::Issue.model_name.human.pluralize, frontend_issues_path
            add_breadcrumb t('spina.conferences.primer_theme.journal.volume_issue', volume_number: @issue.volume.number,
                                                                                    issue_number: @issue.number),
                           frontend_volume_issue_path(@issue.volume.number, @issue.number)
          end

          def set_metadata
            @title = @article.title
            @description = @article.content(:abstract).try(:to_plain_text)
          end

          def require_admin_for_invisible_article
            raise ActiveRecord::RecordNotFound unless current_spina_user.present? || @article.visible?
          rescue ActiveRecord::RecordNotFound # TODO: proper 404 handler
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end
        end
      end
    end
  end
end
