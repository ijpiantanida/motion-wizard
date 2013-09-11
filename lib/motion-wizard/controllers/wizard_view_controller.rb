module MotionWizard
  class WizardViewController < UIViewController
    attr_reader :navigation_bar_view, :content_view, :wizard_data

    DEFAULT_NAVIGATION_BAR_HEIGHT = 44

    def self.steps(*steps)
      @_wizard_steps = steps
    end

    def init
      super
      @steps_controllers = initialize_steps
      @navigation_bar_view = initialize_navigation_bar_view
      @content_view = UIView.alloc.init
      @current_step = 0
      @wizard_data = {}

      self.view.addSubview(@content_view)
      self.view.addSubview(navigation_bar_view)
      add_new_view
      self
    end

    def initialize_navigation_bar_view
      navigation_bar = WizardNavigationBar.alloc.initWitNumberOfSteps(@steps_controllers.size)
      navigation_bar.when_step_selected do |navigation_item|

      end

      navigation_bar.when_step_unselected do |navigation_item|

      end
      navigation_bar
    end

    def initialize_steps
      self.class.instance_variable_get(:@_wizard_steps) || []
    end

    def viewDidLoad
      super
      @content_view.origin = [0,0]
      @content_view.size = self.view.size
      @navigation_bar_view.origin = [0,0]
      @navigation_bar_view.size = [self.view.size.width, DEFAULT_NAVIGATION_BAR_HEIGHT]
    end

    def add_new_view(animation_strategy = AnimationStrategy::None)
      @current_view_controller = @steps_controllers[@current_step].alloc.init
      @current_view_controller.wizard_view_controller = self

      self.addChildViewController(@current_view_controller)
      @content_view.addSubview(@current_view_controller.view)
      @current_view_controller.view.size = @content_view.size
      @current_view_controller.view.restyle!

      animation = animation_strategy.new(@current_view_controller.view)
      animation.animate
      navigation_bar_view.select(@current_step)
    end

    def remove_current_view(animation_strategy = AnimationStrategy::None)
      current_local_view = @current_view_controller
      animation = animation_strategy.new(@current_view_controller.view)
      animation.already_on_final_position = false
      animation.animate do |view|
        view.removeFromSuperview
        current_local_view.removeFromParentViewController
      end
    end

    def next(data = {})
      @wizard_data.merge! data
      @current_step+=1
      change_view(AnimationStrategy::RightToLeft)
      self
    end

    def previous(data = {})
      @wizard_data.merge! data
      @current_step-=1
      change_view(AnimationStrategy::LeftToRight)
      self
    end

    def go_to_step(step_number, data = {})
      @wizard_data.merge! data
      @current_step = step_number
      change_view(AnimationStrategy::LeftToRight)
      self
    end

    def change_view(animation_strategy)
      remove_current_view(animation_strategy)
      add_new_view(animation_strategy)
    end
  end
end