module MotionWizard
  class WizardViewController < UIViewController
    attr_reader :navigation_bar_view, :content_view, :wizard_data

    DEFAULT_NAVIGATION_BAR_HEIGHT = 44

    def self.steps(*steps)
      @_wizard_steps = steps
    end

    def self.forward_animation_strategy(animation_strategy_class)
      @_forward_animation_strategy_class = animation_strategy_class
    end

    def self.backward_animation_strategy(animation_strategy_class)
      @_backward_animation_strategy_class = animation_strategy_class
    end

    def self.index_item_view_class(index_item_view_class)
      @_index_item_view_class = index_item_view_class
    end

    def init
      super
      @steps_controllers_classes = self.class.instance_variable_get(:@_wizard_steps) || []
      @forward_animation_strategy_class = self.class.instance_variable_get(:@_forward_animation_strategy_class) || AnimationStrategy::RightToLeft
      @backward_animation_strategy_class = self.class.instance_variable_get(:@_backward_animation_strategy_class) || AnimationStrategy::LeftToRight
      @index_item_view_class = self.class.instance_variable_get(:@_index_item_view_class) || IndexItem
      @current_step = 0
      @wizard_data = {}
      @steps_controllers = []
      self
    end

    def viewDidLoad
      super

      @content_view = UIView.alloc.init
      @content_view.origin = [0,0]
      @content_view.size = self.view.size
      self.view.addSubview(@content_view)

      @navigation_bar_view = WizardNavigationBar.alloc.init_with_number_of_steps(number_of_steps, self)
      @navigation_bar_view.origin = [0,0]
      @navigation_bar_view.size = [self.view.size.width, DEFAULT_NAVIGATION_BAR_HEIGHT]
      self.view.addSubview(navigation_bar_view)

      add_new_step_view(AnimationStrategy::None.new)
    end

    def reset!
      @wizard_data = {}
      @steps_controllers = []
      @navigation_bar_view.reset!
      navigation_bar_view.select(@current_step)
    end

    def add_new_step_view(animation_strategy)
      @current_view_controller = get_current_step_view_controller
      self.addChildViewController(@current_view_controller)
      @content_view.addSubview(@current_view_controller.view)

      @current_view_controller.view.origin = [0,0]
      animation_strategy.show_view(@current_view_controller.view)
      navigation_bar_view.select(@current_step)
    end

    def get_current_step_view_controller
      @steps_controllers[@current_step] ||= begin
        new_view_controller = @steps_controllers_classes[@current_step].alloc.init
        new_view_controller.extend(MotionWizard::ContentController)
        new_view_controller.wizard_view_controller = self
        new_view_controller.view.size = @content_view.size
        new_view_controller
      end
    end

    def remove_current_step_view(animation_strategy)
      current_local_view = @current_view_controller
      animation_strategy.hide_view(@current_view_controller.view) do |view|
        view.removeFromSuperview
        current_local_view.removeFromParentViewController
      end
    end

    def number_of_steps
      @steps_controllers_classes.size
    end

    def next(data = {})
      @wizard_data.merge! data
      @current_step+=1
      if @current_step >= number_of_steps
        @current_step = number_of_steps - 1
        self.finish
        return
      end
      change_step_view(@forward_animation_strategy_class)
      self
    end

    def previous(data = {})
      @wizard_data.merge! data
      @current_step-=1
      return if @current_step < 0
      change_step_view(@backward_animation_strategy_class)
      self
    end

    def go_to_step(step_number, data = {})
      @wizard_data.merge! data
      animation_klass = @current_step > step_number ? @backward_animation_strategy_class : @forward_animation_strategy_class
      @current_step = step_number
      change_step_view(animation_klass)
      self
    end

    def finish(data = {})
      @wizard_data.merge! data
      self.when_finished
    end

    def change_step_view(animation_strategy_klass)
      animation_strategy = animation_strategy_klass.new
      remove_current_step_view(animation_strategy)
      add_new_step_view(animation_strategy)
      animation_strategy.animate
    end

    def create_index_item_at(index)
      index_item = @index_item_view_class.alloc.init
      index_item.label.text = "%02d" % (index+1)
      index_item
    end

    def setup_index_item_at(index_item, index)
      index_item.label_wrapper.size = index_item.size
      index_item.label.size = index_item.size
    end

    def when_finished;end
  end
end