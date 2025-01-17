# frozen_string_literal: true

require 'test_helper'

module Spina
  module Conferences
    module PrimerTheme
      module Journal
        class ArticlesControllerTest < ActionDispatch::IntegrationTest
          include ::Spina::Engine.routes.url_helpers

          setup do
            @article = spina_admin_journal_articles :new_wave
            @draft_article = spina_admin_journal_articles :empty_article
          end

          test 'should get show' do
            get frontend_volume_issue_article_url(@article.issue.volume.number, @article.issue.number, @article.number)
            assert_response :success
          end

          test 'should not get show for invisible article' do
            get frontend_volume_issue_article_url(@draft_article.issue.volume.number, @draft_article.issue.number,
                                                  @draft_article.number)
            assert_response :missing
          end

          test 'should get show for invisible article if authenticated' do
            @user = spina_users :joe
            post admin_sessions_url, params: { email: @user.email, password: 'password' }
            get frontend_volume_issue_article_url(@draft_article.issue.volume.number, @draft_article.issue.number,
                                                  @draft_article.number)
            assert_response :success
          end

          test 'should handle nonexistent article' do
            get frontend_volume_issue_article_url(@article.issue.volume.number, @article.issue.number,
                                                  Spina::Admin::Journal::Article.last.number + 1)
            assert_response :missing
          end

          test 'should handle nonexistent issue' do
            get frontend_volume_issue_article_url(@article.issue.volume.number,
                                                  Spina::Admin::Journal::Issue.last.number + 1, @article.number)
            assert_response :missing
          end
        end
      end
    end
  end
end
