# frozen_string_literal: true

Spina::Engine.routes.draw do # rubocop:disable Metrics/BlockLength
  namespace :frontend, path: '' do
    devise_for :public_users,
               path: 'members',
               path_names: { sign_in: 'login',
                             sign_out: 'logout',
                             sign_up: 'register',
                             edit: 'account' },
               class_name: 'Spina::Admin::Conferences::Accounts::PublicUser',
               controllers: { confirmations: 'spina/conferences/primer_theme/accounts/public_users/confirmations',
                              passwords: 'spina/conferences/primer_theme/accounts/public_users/passwords',
                              registrations: 'spina/conferences/primer_theme/accounts/public_users/registrations',
                              sessions: 'spina/conferences/primer_theme/accounts/public_users/sessions',
                              unlocks: 'spina/conferences/primer_theme/accounts/public_users/unlocks' }
  end

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
end
