# frozen_string_literal: true

require 'test_helper'

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        class AuthorsControllerTest < ActionDispatch::IntegrationTest
          include ::Spina::Engine.routes.url_helpers

          setup do
            @author = spina_admin_journal_authors :henry
            @author_with_multiple_affiliations = spina_admin_journal_authors :marcus
          end

          test 'should get index' do
            get frontend_authors_url
            assert_response :success
          end

          test 'should get show' do
            get frontend_author_url(@author)
            assert_response :success
          end

          test 'should get show for author with multiple affiliations' do
            get frontend_author_url(@author_with_multiple_affiliations)
            assert_response :success
          end

          test 'should handle missing author' do
            get frontend_author_url(Spina::Admin::Journal::Author.last.id + 1)
            assert_response :missing
          end
        end
      end
    end
  end
end
