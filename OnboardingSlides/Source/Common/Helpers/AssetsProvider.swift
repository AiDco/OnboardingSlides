//
//  AssetsProvider.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit

public final class AssetsProvider {
    public static var cellImage: UIImage? {
        image(named: "cell-image")
    }
    
    public static var onboardingMainColor: UIColor? {
        color(named: "onboarding-main-color")
    }
    
    public static var skipButtonTitleColor: UIColor? {
        color(named: "skip-button-title-color")
    }
    
    public static var nextButtonBackgroundColor: UIColor? {
        color(named: "next-button-background-color")
    }
    
    public static var nextButtonTitleColor: UIColor? {
        color(named: "next-button-title-color")
    }
    
    public static func image(named: String) -> UIImage? {
        UIImage(
            named: named,
            in: Bundle(for: self),
            compatibleWith: nil
        )
    }
    
    public static func color(named: String) -> UIColor? {
        UIColor(
            named: named,
            in: Bundle(for: self),
            compatibleWith: nil
        )
    }
}
