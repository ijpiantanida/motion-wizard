Teacup::Stylesheet.new :wizard_view_controller do
  style :wizard_view_controller,
        backgroundColor: :white.uicolor

  style :index_item,
        height: 10,
        center_y: "100%",
        backgroundColor: :orange.uicolor,
        label_wrapper:{
            backgroundColor: :orange.uicolor,
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
                borderColor: :orange.uicolor.CGColor
            }
        },
        label: {
            textColor: :orange.uicolor
        }

end