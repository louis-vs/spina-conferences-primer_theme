# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Blog
        # Spina::Blog::CategoriesController
        class CategoriesController < ApplicationController
          include ::Spina::Frontend
          
          before_action :page
          before_action :category
          before_action :posts
          before_action :set_breadcrumb, only: :show
          before_action :set_metadata

          def show
            add_breadcrumb t('.category', name: @category.name)
            render layout: theme_layout
          end

          private

          def category
            @category = Spina::Admin::Conferences::Blog::Category.friendly.find params[:id]
          end

          def posts
            @posts = @category.posts.available.live.order(published_at: :desc)
                              .page(params[:page])
          end

          def page
            @page = Spina::Page.find_or_create_by name: 'blog' do |page|
              page.link_url = '/blog'
              page.deletable = false
            end
          end

          def set_breadcrumb
            add_breadcrumb 'Blog', frontend_blog_root_path
          end

          def set_metadata
            @title = @category.name
          end
        end
      end
    end
  end
end
