module MotionWizard
  class WizardNavigationBar < UIView
    def init_with_number_of_steps(number_of_steps, wizard_controller)
      self.init
      @number_of_steps = number_of_steps
      @index_items = []
      @wizard_controller = WeakRef.new(wizard_controller)
      create_index_items
      self
    end

    def create_index_items
      @number_of_steps.times do |i|
        index_item = @wizard_controller.create_index_item_at(i)
        addSubview(index_item)
        @index_items << index_item
      end
    end

    def select(index)
      @index_items[@selected_step].unselect if @selected_step
      @selected_step = index
      @index_items[@selected_step].select if @selected_step
    end

    def setFrame(frame)
      super
      resize_indexes
    end

    def resize_indexes
      return unless @number_of_steps
      index_width = self.frame.size.width / @number_of_steps
      @index_items.each_with_index do |index_item, i|
        index_item.frame = [[index_width*i, 0], [index_width, self.size.height]]
        index_item_resized_at(index_item, i)
      end
    end

    def index_item_resized_at(index_item, i)
      index_item.label.size = index_item.size
    end
  end
end