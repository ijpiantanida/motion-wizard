class MyCustomIndexItemView < UIView
  include Teacup::Layout

  attr_reader :label, :underline

  def init
    super
    self.stylesheet = :index_item
    layout(self, :index_item) do
      @label = subview(UILabel, :label)
      @underline = subview(UIView, :underline)
    end
    self
  end

  def select
    @underline.hidden = false
    @label.textColor = :white.uicolor
  end

  def unselect
    @underline.hidden = true
    @label.textColor = :light_gray.uicolor
  end
end