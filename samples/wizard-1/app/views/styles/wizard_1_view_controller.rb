Teacup::Stylesheet.new :wizard_view_controller do
  style :wizard_view_controller,
        backgroundColor: :white.uicolor

  style :index_item,
        height: 10,
        center_y: "100%",
        backgroundColor: [103,189,71].uicolor,
        label_wrapper:{
            backgroundColor: [103,189,71].uicolor,
            size: [50, 50],
            center: ["50%", "50%"],
            layer: {
                cornerRadius: 25
            }
        },
        label: {
            backgroundColor: :clear.uicolor,
            textColor: :white.uicolor,
            size: ["100%", 20],
            center: ["50%", "50%"]
        }

  style :index_item_unseleted,
        extends: :index_item,
        layer: {
            borderWidth: 0
        }

  style :index_item_selected,
        label_wrapper:{
            backgroundColor: :white.uicolor,
            layer: {
                borderWidth: 2,
                borderColor: [103,189,71].uicolor.CGColor
            }
        },
        label: {
            textColor: [103,189,71].uicolor
        }

end