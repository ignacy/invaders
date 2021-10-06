module Invaders
  module Presenters
    class InvaderMatchPresenter
      def initialize(radar_slice, invader)
        @radar_slice = radar_slice
        @invader = invader
      end

      def to_s
        (
          ['Slice    =>    Invader'] +
          rows +
          ["Confidence level: #{radar_slice.match_level}\n\n"]
        ).join("\n")
      end

      private

      def rows
        radar_slice.rows.each_with_index.inject([]) do |rows, (row, index)|
          rows << "#{row}    =>    #{invader.rows[index]}"
        end
      end

      attr_reader :radar_slice, :invader, :confidence_level
    end
  end
end
