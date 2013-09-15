class Step1ViewController < UIViewController
  stylesheet :step_1

  layout :step do
    @button = subview(UIButton, :button)
    @button.when(UIControlEventTouchUpInside){ self.next }
  end
end

class Step2ViewController < UIViewController
  stylesheet :step_2

  layout :step do
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
    @next_button.when(UIControlEventTouchUpInside) {self.next}
    @back_button.when(UIControlEventTouchUpInside) {self.previous}
  end
end

class Step3ViewController < UIViewController
  stylesheet :step_3

  layout :step do
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
    @next_button.when(UIControlEventTouchUpInside) {self.finish}
    @back_button.when(UIControlEventTouchUpInside) {self.previous}
  end
end
