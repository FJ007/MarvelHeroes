//
//  Appearance.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 23/12/20.
//

import Foundation
import UIKit

struct AppearanceCustom {
    static func setCornerRadius(to view: UIView, cornerRadius: CGFloat) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
    
    static func setShadow(to view: UIView, shadowColor: CGColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float) {
        view.layer.shadowColor = shadowColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.masksToBounds = false
    }
}
