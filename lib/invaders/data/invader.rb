module Invaders
  class Invader < Base
    def rows_string
      @rows_string ||= rows.join
    end
  end
end
