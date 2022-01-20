# frozen_string_literal: true

module Spina
  module Conferences
    module PrimerTheme
      # Breadcrumbs for the frontend.
      module Breadcrumbs
        # Custom builder using Primer breadcrumbs.
        class Builder < BreadcrumbsOnRails::Breadcrumbs::Builder
          def render
            @context.render ::Primer::Beta::Breadcrumbs.new(mb: 4) do |component|
              @elements.each do |element|
                component.item(href: compute_path(element), **element.options) { compute_name(element) }
              end
            end
          end
        end
      end
    end
  end
end
