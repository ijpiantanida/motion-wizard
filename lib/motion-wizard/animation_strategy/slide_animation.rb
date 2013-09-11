module MotionWizard
  module AnimationStrategy
    class SlideAnimation < BaseAnimationStrategy
      attr_accessor :direction

      def animate(&after_block)
        @view.origin = [@view.origin.x + @direction*App.frame.size.width, @view.origin.y] if @already_on_final_position
        UIView.animateWithDuration(@duration, animations: ->{
          @view.origin = [@view.origin.x - @direction*App.frame.size.width, @view.origin.y]
        }, completion: ->(finished){
          after_block.call(@view) if after_block
        })
      end
    end
  end
end