module MotionWizard
  module AnimationStrategy
    class Ios7SlideLeftToRight < SlideAnimation
      def initialize
        super
        @duration = 0.25
      end

      def animate
        show_view_index = @show_view.superview.subviews.index(@show_view)
        hide_view_index = @show_view.superview.subviews.index(@hide_view)
        @show_view.superview.exchangeSubviewAtIndex(hide_view_index, withSubviewAtIndex: show_view_index) if show_view_index > hide_view_index
        do_slide_animation(@show_view, -70, 0, @show_view_after_block)
        do_slide_animation(@hide_view, 0, App.frame.size.width, @hide_view_after_block)
      end
    end
  end
end