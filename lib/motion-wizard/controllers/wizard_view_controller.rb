module MotionWizard
  class WizardViewController < UIViewController
    attr_reader :navigation_bar_view, :content_view, :wizard_data

    DEFAULT_NAVIGATION_BAR_HEIGHT = 44

    def self.steps(*steps)
      @_wizard_steps = steps
    end

    def init
      super
      @current_step = 0
      @wizard_data = {}
      @steps_controllers_classes = initialize_steps
      @steps_controllers = []
      self
    end

    def initialize_navigation_bar_view
      WizardNavigationBar.alloc.init_with_number_of_steps(@steps_controllers_classes.size, self)
    end

    def initialize_steps
      self.class.instance_variable_get(:@_wizard_steps) || []
    end

    def viewDidLoad
      super

      @content_view = UIView.alloc.init
      @content_view.origin = [0,0]
      @content_view.size = self.view.size
      self.view.addSubview(@content_view)

      @navigation_bar_view = initialize_navigation_bar_view
      @navigation_bar_view.origin = [0,0]
      @navigation_bar_view.size = [self.view.size.width, DEFAULT_NAVIGATION_BAR_HEIGHT]
      self.view.addSubview(navigation_bar_view)

      add_new_step_view
    end

    def reset!
      @steps_controllers = []
    end

    def add_new_step_view(animation_strategy = AnimationStrategy::None)
      @current_view_controller = @steps_controllers[@current_step] ||= begin
        new_view_controller = @steps_controllers_classes[@current_step].alloc.init
        new_view_controller.extend(MotionWizard::ContentController)
        new_view_controller.wizard_view_controller = self
        new_view_controller.view.size = @content_view.size
        new_view_controller
      end

      self.addChildViewController(@current_view_controller)
      @content_view.addSubview(@current_view_controller.view)

      @current_view_controller.view.origin = [0,0]
      animation = animation_strategy.new(@current_view_controller.view)
      animation.animate
      navigation_bar_view.select(@current_step)
    end

    def remove_current_step_view(animation_strategy = AnimationStrategy::None)
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
      change_step_view(AnimationStrategy::RightToLeft)
      self
    end

    def previous(data = {})
      @wizard_data.merge! data
      @current_step-=1
      change_step_view(AnimationStrategy::LeftToRight)
      self
    end

    def go_to_step(step_number, data = {})
      @wizard_data.merge! data
      @current_step = step_number
      change_step_view(AnimationStrategy::LeftToRight)
      self
    end

    def change_step_view(animation_strategy)
      remove_current_step_view(animation_strategy)
      add_new_step_view(animation_strategy)
    end

    def create_index_item_at(index)
      index_item = IndexItem.alloc.init
      index_item.label.text = "%02d" % (index+1)
      index_item
    end

    def index_item_added_to_view_at(index_item, index);end
  end
end