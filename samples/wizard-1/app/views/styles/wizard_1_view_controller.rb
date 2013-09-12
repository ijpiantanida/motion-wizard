Teacup::Stylesheet.new :wizard_view_controller do
  style :wizard_view_controller,
        backgroundColor: :white.uicolor

  style :index_item,
        height: 10,
        center_y: "60%",
        backgroundColor: :orange.uicolor,
        label_wrapper:{
            backgroundColor: :orange.uicolor,
            size: [50, 50],
            center: ["50%", "50%"],
            layer: {
                borderWidth: 0,
                cornerRadius: 25
            }
        },
        label: {
            backgroundColor: :clear.uicolor,
            textColor: :white.uicolor,
            height: 20,
            center: ["50%", "50%"]
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