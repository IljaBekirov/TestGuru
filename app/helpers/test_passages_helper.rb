# frozen_string_literal: true

module TestPassagesHelper
  def progress(now, max)
    now * 100 / max
  end
end
