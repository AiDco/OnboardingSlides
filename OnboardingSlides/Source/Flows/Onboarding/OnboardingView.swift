//
//  OnboardingView.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 02.12.2021.
//

import UIKit
import SnapKit

public final class OnboardingView: UIView {
    // MARK: - Properties
    public var onboardingSlides: [OnboardingSlide]
    private var currentPage: Int = 0 {
        didSet {
            if currentPage == onboardingSlides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = AssetsProvider.onboardingMainColor
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl(frame: .zero)
        control.numberOfPages = onboardingSlides.count
        control.currentPageIndicatorTintColor = .white
        control.pageIndicatorTintColor = .systemGray
        return control
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(
            AssetsProvider.skipButtonTitleColor,
            for: .normal
        )
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(
            AssetsProvider.nextButtonTitleColor,
            for: .normal
        )
        button.backgroundColor = AssetsProvider.nextButtonBackgroundColor
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                skipButton,
                nextButton
            ]
        )
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                pageControl,
                buttonsStackView
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - View Lifecycle
    public init(
        onboardingSlides: [OnboardingSlide],
        backgroundColor: UIColor?
    ) {
        self.onboardingSlides = onboardingSlides
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        
        collectionView.register(
            OnboardingSlideCell.self,
            forCellWithReuseIdentifier: OnboardingSlideCell.indentidier
        )
        nextButton.addTarget(
            self,
            action: #selector(didPressNextButton),
            for: .touchUpInside
        )
        
        addSubview(collectionView)
        addSubview(bottomStackView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        nextButton.layer.cornerRadius = 16
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
    
    @objc
    private func didPressNextButton() {
        if currentPage == onboardingSlides.count - 1 {
            
        } else {
            currentPage += 1
            collectionView.scrollToItem(
                at: IndexPath(item: currentPage, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
        }
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {
    public func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int { onboardingSlides.count }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingSlideCell.indentidier,
            for: indexPath
        ) as? OnboardingSlideCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: onboardingSlides[indexPath.row])
        
        return cell
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let cell = cell as? OnboardingSlideCell {
                self.buttonsStackView.snp.remakeConstraints {
                    $0.height.equalTo(48)
                }
                self.bottomStackView.snp.remakeConstraints {
                    $0.bottom.equalTo(cell.scrollViewContentView.snp.bottom).offset(-44)
                    $0.trailing.equalTo(cell.scrollViewContentView.snp.trailing).offset(-24)
                    $0.leading.equalTo(cell.scrollViewContentView.snp.leading).offset(24)
                }
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingView: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize { UIScreen.main.bounds.size }
}

