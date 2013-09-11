module MotionWizard
  module AnimationStrategy
    class LeftToRight < SlideAnimation
      def initialize(view)
        super
        @direction = -1
      end
    end
  end
end