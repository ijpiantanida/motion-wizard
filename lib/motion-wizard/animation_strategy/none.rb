module MotionWizard
  module AnimationStrategy
    class None < BaseAnimationStrategy
      def initialize; end

      def show_view(view); end
      def hide_view(view); end
    end
  end
end
