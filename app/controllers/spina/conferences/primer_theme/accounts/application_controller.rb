# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      module Accounts
        # Base class from which the devise controller inherits, as defined in its initializer.
        class ApplicationController < Spina::Conferences::PrimerTheme::ApplicationController
          class Responder < ActionController::Responder
            def to_turbo_stream
              controller.render(options.merge(formats: :html))
            rescue ActionView::MissingTemplate => error
              if get?
                raise error
              elsif has_errors? && default_action
                render rendering_options.merge(formats: :html, status: :unprocessable_entity)
              else
                redirect_to navigation_location
              end
            end
          end

          self.responder = Responder
          respond_to :html, :turbo_stream
        end
      end
    end
  end
end
