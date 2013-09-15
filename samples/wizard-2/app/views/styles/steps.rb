Teacup::Stylesheet.new :steps do
  @font = "Helvetica-Light".uifont(26)
  @background_image = "button".uiimage
  @button_top = "100% - 160"

  style :step,
        backgroundColor: :clear.uicolor

  style :big_button,
        size: ["100%", 50],
        center_x: "50%",
        backgroundImage: @background_image,
        titleColor: :white.uicolor

end

Teacup::Stylesheet.new :step_1 do
  import :steps

  style :button,
    extends: :big_button,
    title: "Start here >",
    font: @font,
    top: @button_top
end

Teacup::Stylesheet.new :step_2 do
  import :steps

  style :base_button,
        size: ["50%", 50],
        top: @button_top,
        titleColor: :white.uicolor,
        backgroundImage: @background_image,
        font: @font

  style :next_button,
        extends: :base_button,
        title: "Next >",
        left: "50%"

  style :back_button,
        extends: :base_button,
        title: "< Back",
        left: 0
end

Teacup::Stylesheet.new :step_3 do
  import :steps

  style :base_button,
        size: ["50%", 50],
        top: @button_top,
        titleColor: :white.uicolor,
        backgroundImage: @background_image,
        font: @font

  style :next_button,
        extends: :base_button,
        title: "Finish",
        left: "50%"

  style :back_button,
        extends: :base_button,
        title: "< Back",
        left: 0
end