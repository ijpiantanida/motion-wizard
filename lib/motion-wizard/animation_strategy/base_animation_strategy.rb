module MotionWizard
  module AnimationStrategy
    class BaseAnimationStrategy
      attr_accessor :already_on_final_position, :duration

      def initialize
        @duration = 0.5
      end

      def show_view(view)
        raise "Subclass responsability"
      end

      def hide_view(view)
        raise "Subclass responsability"
      end
    end
  end
end