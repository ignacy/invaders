module Invaders
  module Presenters
    class InvaderMatchPresenter
      def initialize(radar_slice, invader, confidence_level = "XX")
        @radar_slice = radar_slice
        @invader = invader
        @confidence_level = confidence_level
      end

      def to_s
        (
          [ "Slice    =>    Invader" ] +
          rows +
          [ "Confidence level: #{confidence_level}\n\n" ]
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
