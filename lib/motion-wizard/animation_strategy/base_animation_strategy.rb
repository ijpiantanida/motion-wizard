module MotionWizard
  module AnimationStrategy
    class BaseAnimationStrategy
      attr_accessor :already_on_final_position, :duration

      def initialize(view)
        @view = view
        @already_on_final_position = true
        @duration = 0.5
      end

      def animate
        raise "Subclass responsability"
      end
    end
  end
end