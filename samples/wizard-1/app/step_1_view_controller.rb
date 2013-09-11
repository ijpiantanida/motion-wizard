class Step1ViewController < UIViewController
  include MotionWizard::ContentController

  layout do
    subview(UILabel, text: "Hi 1", size: [100, 20], origin: [50, 100])
    @button = subview(UIButton, title: "Next", size: [100, 20], origin: [50, 180])
    @button.when(UIControlEventTouchUpInside) do
      self.next
    end
  end
end

class Step2ViewController < UIViewController
  include MotionWizard::ContentController
  layout do
    subview(UILabel, text: "Hi 2", size: [100, 20], origin: [50, 200])
    @button = subview(UIButton, title: "Back", size: [100, 20], origin: [50, 180])
    @button.when(UIControlEventTouchUpInside) do
      self.previous
    end
  end
end