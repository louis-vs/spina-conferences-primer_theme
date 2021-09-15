# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Accounts
        # Base class from which the devise controller inherits, as defined in its initializer.
        class ApplicationController < Spina::ApplicationController
          def cookies_info
            render partial: 'cookies'
          end
        end
      end
    end
  end
end
