module MotionWizard
  module AnimationStrategy
    class RightToLeft < SlideAnimation
      def initialize
        super
        @direction = 1
      end
    end
  end
end