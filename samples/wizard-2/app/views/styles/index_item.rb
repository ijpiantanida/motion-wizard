Teacup::Stylesheet.new :index_item do
  style :index_item,
        backgroundColor: :clear.uicolor

  style :label,
        size: ["100%", 20],
        center_x: "50%",
        top: "100% - 24",
        textColor: :white.uicolor,
        textAlignment: NSTextAlignmentCenter,
        backgroundColor: :clear.uicolor,
        font: "Helvetica".uifont(18)

  style :underline,
        size: ["30%", 1],
        center_x: "50%",
        top: "100% - 1",
        backgroundColor: :white.uicolor,
        hidden: true

  style :selected,
        label: {
            textColor: :white.uicolor,
        },
        underline: {
            hidden: false
        }

  style :unselected,
        underline: {
            hidden: true
        },
        label: {
            textColor: :gray.uicolor
        }
end