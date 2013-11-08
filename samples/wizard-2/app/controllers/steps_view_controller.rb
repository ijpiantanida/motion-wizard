class Step1ViewController < UIViewController
  stylesheet :step_1

  layout :step do
    @button = subview(UIButton, :button)
  end
  
  def viewWillAppear(animated)
    super
    @button.on(:touch){ self.next }
  end

  def viewWillDisappear(animated)
    super
    @button.off(:touch)
  end
end

class Step2ViewController < UIViewController
  stylesheet :step_2

  layout :step do
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
  end

  def viewWillAppear(animated)
    super
    @next_button.on(:touch) {self.next}
    @back_button.on(:touch) {self.previous}
  end

  def viewWillDisappear(animated)
    super
    @next_button.off(:touch)
    @back_button.off(:touch)
  end
end

class Step3ViewController < UIViewController
  stylesheet :step_3

  layout :step do
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
  end

  def viewWillAppear(animated)
    super
    @next_button.on(:touch) {self.finish}
    @back_button.on(:touch) {self.previous}
  end

  def viewWillDisappear(animated)
    super
    @next_button.off(:touch)
    @back_button.off(:touch)
  end
end
