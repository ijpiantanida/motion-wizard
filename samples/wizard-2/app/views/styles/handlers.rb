Teacup.handler UIButton, :titleColor { |button, color|
  button.setTitleColor(color, forState: UIControlStateNormal)
}

Teacup.handler UIButton, :backgroundImage { |button, image|
  button.setBackgroundImage(image, forState: UIControlStateNormal)
}
