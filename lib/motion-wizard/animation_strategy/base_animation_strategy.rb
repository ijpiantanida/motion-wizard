module MotionWizard
  module AnimationStrategy
    class BaseAnimationStrategy
      attr_accessor :already_on_final_position, :duration

      def initialize
        @duration = 0.5
      end

      def show_view(view, &after_block)
        @show_view = view
        @show_view_after_block = after_block
      end

      def hide_view(view, &after_block)
        @hide_view = view
        @hide_view_after_block = after_block
      end

      def animate
        raise "Subclass responsability"
      end
    end
  end
end