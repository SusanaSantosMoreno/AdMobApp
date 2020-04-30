//
//  RoundedButton.swift
//  AdMobApp
//
//  Created by Susana Santos Moreno on 29/04/2020.
//  Copyright © 2020 Susana Santos Moreno. All rights reserved.
//

import UIKit

public class RoundedButton: UIButton {

  override public func layoutSubviews() {
    super.layoutSubviews()

    self.layer.cornerRadius = bounds.size.height / 4.0
    layer.masksToBounds = true
  }

}
