module MotionWizard
  module AnimationStrategy
    class RightToLeft < SlideAnimation
      def initialize(view)
        super
        @direction = 1
      end
    end
  end
end