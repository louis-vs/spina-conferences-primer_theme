# frozen_string_literal: true

module Spina
  module Parts
    module Conferences
      module PrimerTheme
        # A simplistic checkbox part, e.g. to indicate whether an item should
        # show or not.
        class Checkbox < Spina::Parts::Base
          # Booleans don't work nicely with Spina page parts, so we have this mess
          CHECKED_VALUE = '1'
          UNCHECKED_VALUE = '0'

          attr_json :content, :string, default: UNCHECKED_VALUE
        end
      end
    end
  end
end
