# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  # makes Current.user accessible in view files.
  attribute :user
end
