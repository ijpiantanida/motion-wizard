module MotionWizard
  module AnimationStrategy
    class SlideAnimation < BaseAnimationStrategy
      attr_accessor :direction

      def animate
        do_slide_animation(@show_view, @direction*App.frame.size.width, 0, @show_view_after_block)
        do_slide_animation(@hide_view, 0, -@direction*App.frame.size.width, @hide_view_after_block)
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