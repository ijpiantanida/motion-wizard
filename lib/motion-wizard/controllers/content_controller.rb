module MotionWizard
  module ContentController
    attr_reader :wizard_view_controller

    def viewDidLoad
      super
      self.view.clipsToBounds = true
    end

    def wizard_view_controller=(wizard_view_controller)
      @wizard_view_controller = WeakRef.new(wizard_view_controller)
    end

    def next(data={})
      @wizard_view_controller.next(data)
    end

    def previous(data={})
      @wizard_view_controller.previous(data)
    end

    def go_to_step(step_number, data={})
      @wizard_view_controller.go_to_step(step_number, data)
    end

    def wizard_data
      @wizard_view_controller.wizard_data
    end

    def reset!
      @wizard_view_controller.reset!
    end
  end
end