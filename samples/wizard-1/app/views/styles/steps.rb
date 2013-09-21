Teacup::Stylesheet.new :steps do
  style :step,
        backgroundColor: :white.uicolor

  style :big_button,
        size: ["100% - 40", 35],
        center_x: "50%",
        backgroundColor: [103,189,71].uicolor

end

Teacup::Stylesheet.new :step_1 do
  import :steps

  style :text_field,
    placeholder: "Put some text here",
    size: ["100% - 40", 35],
    top: 130,
    center_x: "50%",
    textAlignment: NSTextAlignmentCenter,
    contentVerticalAlignment: UIControlContentVerticalAlignmentCenter,
    layer: {
        borderWidth: 1,
        cornerRadius: 5
    }

  style :button,
    extends: :big_button,
    title: "And tap here...",
    top: 180
end

Teacup::Stylesheet.new :step_2 do
  import :steps

  style :text_field,
        placeholder: "Also add some text here",
        size: ["100% - 40", 35],
        top: 130,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        contentVerticalAlignment: UIControlContentVerticalAlignmentCenter,
        layer: {
            borderWidth: 1,
            cornerRadius: 5
        }

  style :base_button,
        size: ["50% - 40", 35],
        backgroundColor: [103,189,71].uicolor

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
        text: "Not much to do around here",
        size: ["100% - 40", 35],
        top: 130,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: [103,189,71].uicolor

  style :base_button,
        size: ["50% - 40", 35],
        backgroundColor: [103,189,71].uicolor

  style :next_button,
        extends: :base_button,
        title: ">",
        origin: ["50% + 10", 180]

  style :back_button,
        extends: :base_button,
        title: "<",
        origin: [20, 180]
end

Teacup::Stylesheet.new :step_4 do
  import :steps

  style :label,
        text: "End of the journey",
        size: ["100% - 40", 35],
        top: 130,
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: [103,189,71].uicolor

  style :data,
        size: ["100% - 40", 35],
        center_x: "50%",
        textAlignment: NSTextAlignmentCenter,
        textColor: [103,189,71].uicolor

  style :step_1_data,
        extends: :data,
        top: 180

  style :step_2_data,
        extends: :data,
        top: 220

  style :reset_button,
        extends: :big_button,
        title: "Reset!",
        top: 320

  style :start_over_button,
        extends: :big_button,
        title: "Start over!",
        top: 360

  style :finish_button,
        extends: :big_button,
        title: "Finish",
        top: 400
end
