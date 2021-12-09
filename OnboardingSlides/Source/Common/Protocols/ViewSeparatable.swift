//
//  ViewSeparatable.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit

public protocol ViewSeparatable {
    associatedtype RootView: UIView
}

extension ViewSeparatable where Self: UIViewController {
    func view() -> RootView {
        guard let view = self.view as? RootView else {
            return RootView()
        }
        return view
    }
}

