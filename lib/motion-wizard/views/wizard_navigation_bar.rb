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
        @index_items << index_item
        addSubview(index_item)
      end
    end

    def select(index)
      @index_items[@selected_step].unselect if @selected_step && @index_items[@selected_step].respond_to?(:unselect)
      @selected_step = index
      @index_items[@selected_step].select if @selected_step && @index_items[@selected_step].respond_to?(:select)
    end

    def setFrame(frame)
      super
      resize_indexes
    end

    def reset!
      remove_all_index_items
      create_index_items
      resize_indexes
    end

    def remove_all_index_items
      @index_items.each{|i| i.removeFromSuperview}
      @index_items.clear
    end

    def resize_indexes
      return unless @number_of_steps
      index_width = (self.frame.size.width).to_f / @number_of_steps
      @index_items.each_with_index do |index_item, i|
        index_item.frame = [[index_width*i, 0], [index_width, self.size.height]]
        index_item_resized_at(index_item, i)
      end
    end

    def index_item_resized_at(index_item, i)
      @wizard_controller.index_item_resized_at(index_item, i)
    end
  end
end