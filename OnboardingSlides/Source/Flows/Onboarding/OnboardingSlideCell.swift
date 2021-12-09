//
//  OnboardingSlideCell.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit
import SnapKit

public final class OnboardingSlideCell: UICollectionViewCell {
    // MARK: - Properties
    public static let indentidier = "OnboardingSlideCell"
    
    public lazy var scrollView = UIScrollView()
    public lazy var scrollViewContentView = UIView()
    public var onboardingImageView: OnboardingSlide.OnboardingSlideImageView?
    public var titleLabel: UILabel!
    public var subtitleLabel: UILabel?
    
    public lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                titleLabel
            ]
        )
        if let onboardingImageView = onboardingImageView?.value {
            stackView.insertArrangedSubview(onboardingImageView, at: 0)
            stackView.setCustomSpacing(55, after: onboardingImageView)
        }
        if let subtitleLabel = subtitleLabel {
            stackView.addArrangedSubview(subtitleLabel)
        }
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        scrollView.removeFromSuperview()
        scrollViewContentView.removeFromSuperview()
        stackView.removeFromSuperview()
    }
     
    func configure(with onboardingSlide: OnboardingSlide) {
        configureScrollView()
        onboardingImageView = onboardingSlide.imageView
        onboardingImageView?.value.contentMode = .scaleAspectFill
        
        if let onboardingImageView = onboardingImageView {
            let imageView = onboardingImageView.value
            switch onboardingImageView.constraint {
            case let .aspectRatio(multiplier):
                imageView.snp.makeConstraints {
                    $0.width.equalTo(imageView.snp.height).multipliedBy(multiplier)
                }
            case let .height(constant):
                imageView.snp.makeConstraints {
                    $0.height.equalTo(constant)
                }
            }
        }
        
        titleLabel = onboardingSlide.titleLabel
        titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 24)
        
        subtitleLabel = onboardingSlide.subtitleLabel
        subtitleLabel?.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor "
        subtitleLabel?.font = .systemFont(ofSize: 15)
        subtitleLabel?.numberOfLines = 0
        subtitleLabel?.textColor = .white
        subtitleLabel?.textAlignment = .center
        
        scrollViewContentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.lessThanOrEqualToSuperview().offset(-182)
        }
    }
    
    func configureScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(scrollView).priority(.low)
            $0.height.greaterThanOrEqualTo(UIScreen.main.bounds.size)
        }
    }
}
