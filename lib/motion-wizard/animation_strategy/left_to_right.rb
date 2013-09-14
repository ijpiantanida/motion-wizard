module MotionWizard
  module AnimationStrategy
    class LeftToRight < SlideAnimation
      def initialize
        super
        @direction = -1
      end
    end
  end
end