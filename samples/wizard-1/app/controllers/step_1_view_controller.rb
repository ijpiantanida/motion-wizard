class Step1ViewController < UIViewController
  include MotionWizard::ContentController

  stylesheet :step_1

  layout :step do
    @text_field = subview(UITextField, :text_field)
    @button = subview(UIButton, :button)
    @button.when(UIControlEventTouchUpInside) do
      self.next(text: @text_field.text)
    end
  end
end

class Step2ViewController < UIViewController
  include MotionWizard::ContentController

  stylesheet :step_2

  layout :step do
    subview(UILabel, :label)
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
    @next_button.when(UIControlEventTouchUpInside) {self.next}
    @back_button.when(UIControlEventTouchUpInside) {self.previous}
  end
end

class Step3ViewController < UIViewController
  include MotionWizard::ContentController

  stylesheet :step_3

  layout :step do
    subview(UILabel, :label)
    @data = subview(UILabel, :data)
    @button = subview(UIButton, :button)
    @button.when(UIControlEventTouchUpInside) do
      self.go_to_step(0)
    end
  end

  def viewWillAppear(animated)
    super
    @data.text = self.wizard_data[:text]
  end
end