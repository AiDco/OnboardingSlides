//
//  OnboardingViewController.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit
import SnapKit

public final class OnboardingViewController: UIViewController {
    // MARK: - Properties
    private let onboardingView: OnboardingView

    // MARK: - View Lifecycle
    public init(
        onboardingSlides: [OnboardingSlide],
        backgroundColor: UIColor? = AssetsProvider.onboardingMainColor
    ) {
        onboardingView = OnboardingView(
            onboardingSlides: onboardingSlides,
            backgroundColor: backgroundColor
        )
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = onboardingView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - ViewSeparatable
extension OnboardingViewController: ViewSeparatable {
    public typealias RootView = OnboardingView
}
