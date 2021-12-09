//
//  OnboardingSlide.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit

public struct OnboardingSlide {
    public let imageView: OnboardingSlideImageView?
    public let titleLabel: UILabel
    public let subtitleLabel: UILabel?
    
    public init(
        imageView: OnboardingSlideImageView?,
        titleLabel: UILabel,
        subtitleLabel: UILabel?
    ) {
        self.imageView = imageView
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
    }

    public struct OnboardingSlideImageView {
        public let value: UIImageView
        public let constraint: ImageViewConstraint
        
        public enum ImageViewConstraint {
            case aspectRatio(multiplier: CGFloat)
            case height(CGFloat)
        }
        
        public init(
            value: UIImageView,
            constraint: ImageViewConstraint
        ) {
            self.value = value
            self.constraint = constraint
        }
    }
}
