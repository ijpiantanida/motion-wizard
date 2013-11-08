class Step1ViewController < UIViewController
  stylesheet :step_1

  layout :step do
    @text_field = subview(UITextField, :text_field)
    @button = subview(UIButton, :button)
  end

  def viewWillAppear(animated)
    super
    @button.on(:touch){ self.next(step_1_text: @text_field.text) }
  end

  def viewWillDisappear(animated)
    super
    @button.off(:touch)
  end
end

class Step2ViewController < UIViewController
  stylesheet :step_2

  layout :step do
    @text_field = subview(UITextField, :text_field)
    @next_button = subview(UIButton, :next_button)
    @back_button = subview(UIButton, :back_button)
  end

  def viewWillAppear(animated)
    super
    @next_button.on(:touch) {self.next(step_2_text: @text_field.text)}
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
    subview(UILabel, :label)
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

class Step4ViewController < UIViewController
  stylesheet :step_4

  layout :step do
    subview(UILabel, :label)
    @step_1_data = subview(UILabel, :step_1_data)
    @step_2_data = subview(UILabel, :step_2_data)
    @reset_button = subview(UIButton, :reset_button)
    @finish_button = subview(UIButton, :finish_button)
    @start_over_button = subview(UIButton, :start_over_button)
  end

  def viewWillAppear(animated)
    super
    @step_1_data.text = "Step 1: #{self.wizard_data[:step_1_text]}"
    @step_2_data.text = "Step 2: #{self.wizard_data[:step_2_text]}"

    @start_over_button.on(:touch) {self.go_to_step(0)}
    @reset_button.on(:touch) {self.reset!}
    @finish_button.on(:touch) {self.next}
  end

  def viewWillDisappear(animated)
    super
    @start_over_button.off(:touch)
    @reset_button.off(:touch)
    @finish_button.off(:touch)
  end
end