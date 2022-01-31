# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        # User-facing controller for authors
        class AuthorsController < ApplicationController
          before_action :set_journal, :set_breadcrumb
          before_action :set_author, only: :show
          before_action :set_metadata

          def index
            @authors = Admin::Journal::Author.all.sort do |a, b|
              a.primary_affiliation.name <=> b.primary_affiliation.name
            end
          end

          def show
            add_breadcrumb @author.primary_affiliation.name
          end

          private

          def set_journal
            @journal = Admin::Journal::Journal.instance
          end

          def set_author
            @author = Admin::Journal::Author.includes(:affiliations, :articles).find(params[:id])
          rescue ActiveRecord::RecordNotFound
            send_file Rails.root.join('public/404.html'), type: 'text/html; charset=utf-8', status: 404
          end

          def set_metadata
            @title = @journal.name
            @description = ActionView::Base.full_sanitizer.sanitize(@journal.content(:description))
          end

          def set_breadcrumb
            add_breadcrumb helpers.journal_abbreviation_or_name(@journal), frontend_issues_path
            add_breadcrumb Admin::Journal::Author.model_name.human(count: :many), frontend_authors_path
          end
        end
      end
    end
  end
end
