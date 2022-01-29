# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Blog
        # Spina::Blog::PostsController
        class PostsController < ApplicationController
          before_action :find_posts, only: [:index]
          before_action :current_spina_user_can_view_page?
          before_action :set_breadcrumb, only: :show

          decorates_assigned :posts, :post

          def index
            @posts = @posts.unscope(where: :draft) if current_spina_user&.admin?

            @title = t('.blog')

            respond_to do |format|
              format.atom
              format.html { render layout: theme_layout }
            end
          end

          def show
            @post = Spina::Admin::Conferences::Blog::Post.friendly.find params[:id]
            set_metadata
            add_breadcrumb @post.title
            render layout: theme_layout
          rescue ActiveRecord::RecordNotFound
            try_redirect
          end

          def archive
            @posts = Spina::Admin::Conferences::Blog::Post.live
                                                          .where(published_at: start_date..end_date)
                                                          .order(published_at: :desc)
                                                          .page(params[:page])

            render layout: theme_layout
          end

          private

          def start_date
            Time.zone.local(params[:year].to_i, (params[:month] || 1).to_i)
          end

          def end_date
            start_date.end_of_year
          end

          def page
            @page ||= Spina::Page.find_or_create_by name: 'blog' do |page|
              page.title = 'Blog'
              page.link_url = '/blog'
              page.deletable = false
            end
          end

          def find_posts
            @posts = Spina::Admin::Conferences::Blog::Post.available.live.order(published_at: :desc)
                                                          .page(params[:page])
          end

          def try_redirect
            rule = RewriteRule.find_by!(old_path: "/blog/posts/#{params[:id]}")
            redirect_to rule.new_path, status: :moved_permanently
          end

          def current_spina_user_can_view_page?
            raise ActiveRecord::RecordNotFound unless current_spina_user.present? || page.live?
          end

          def set_breadcrumb
            add_breadcrumb 'Blog', frontend_blog_root_path
          end

          def set_metadata
            @title = @post.seo_title.presence || @post.title
            @description = @post.description
          end
        end
      end
    end
  end
end
