module MotionWizard
  module AnimationStrategy
    class SlideAnimation < BaseAnimationStrategy
      attr_accessor :direction

      def show_view(view, &after_block)
        do_slide_animation(view, @direction*App.frame.size.width, 0, after_block)
      end

      def hide_view(view, &after_block)
        do_slide_animation(view, 0, -@direction*App.frame.size.width, after_block)
      end

      def do_slide_animation(view, initial_position, final_position, after_block)
        view.origin = [initial_position, view.origin.y]
        UIView.animateWithDuration(@duration, animations: -> {
          view.origin = [final_position, view.origin.y]
        },completion: ->(finished) {
          after_block.call(view) if after_block
        })
      end
    end
  end
end