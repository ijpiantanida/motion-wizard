Teacup::Stylesheet.new :steps do
  style :step,
        backgroundColor: :clear.uicolor
end

Teacup::Stylesheet.new :step_1 do
  import :steps

  style :text_field,
    placeholder: "Put some text here",
    size: ["100% - 40", 30],
    top: 130,
    center_x: "50%",
    textAlignment: NSTextAlignmentCenter,
    contentVerticalAlignment: UIControlContentVerticalAlignmentCenter,
    layer: {
        borderWidth: 1,
        cornerRadius: 5
    }

  style :button,
    title: "And click here...",
    size: ["100% - 40", 30],
    top: 180,
    center_x: "50%",
    backgroundColor: :orange.uicolor
end

Teacup::Stylesheet.new :step_2 do
  import :steps

  style :label,
        text: "Not much to do here",
        size: ["100% - 40", 30],
        top: 130,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: :orange.uicolor

  style :base_button,
        size: ["50% - 40", 30],
        backgroundColor: :orange.uicolor

  style :next_button,
        extends: :base_button,
        title: ">",
        origin: ["50% + 10", 180]

  style :back_button,
        extends: :base_button,
        title: "<",
        origin: [20, 180]
end

Teacup::Stylesheet.new :step_3 do
  import :steps

  style :label,
        text: "End of the journey",
        size: ["100% - 40", 30],
        top: 130,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: :orange.uicolor

  style :data,
        size: ["100% - 40", 30],
        top: 180,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: :orange.uicolor

  style :button,
        size: ["100% - 40", 30],
        center_x: "50%",
        backgroundColor: :orange.uicolor,
        title: "Start over!",
        top: 230
end
