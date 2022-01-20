# frozen_string_literal: true

Spina::Engine.routes.draw do
  namespace :frontend, path: 'conferences', module: 'conferences/primer_theme/conferences' do
    resources :conferences, only: %i[index show] do
      resources :presentations, only: [:show]
    end
    resources :presentations, only: [:show]
    get 'cookies-info', controller: 'application'
  end

  namespace :frontend, path: 'journal', module: 'conferences/primer_theme/journal' do
    resources :issues, only: %i[index show] do
      resources :articles, only: %i[show]
    end
  end

  namespace :frontend, as: 'frontend_blog', path: 'blog', module: 'conferences/primer_theme/blog' do
    root to: 'posts#index'

    get ':id', to: 'posts#show', as: :post

    # Redirects for old sites that used the old blog path
    get 'posts/', to: redirect('/blog'), as: :old_index
    get 'posts/:id', to: redirect('/blog/%{id}'), as: :old_post # rubocop:disable Style/FormatStringToken

    get 'feed.atom', to: 'posts#index', as: :rss_feed, defaults: { format: :atom }
    get 'categories/:id', to: 'categories#show', as: :category
    get 'archive/:year(/:month)', to: 'posts#archive', as: :archive_posts
  end
end
