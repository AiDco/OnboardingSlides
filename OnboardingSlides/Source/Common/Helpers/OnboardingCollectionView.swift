//
//  OnboardingCollectionView.swift
//  OnboardingSlides
//
//  Created by Maxim Soroka on 06.12.2021.
//

import UIKit

final public class OnboardingCollectionView: UICollectionView {
    public override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            if self.intrinsicContentSize.height > frame.size.height {
                self.invalidateIntrinsicContentSize()
            }
        }
    }
    
    public override var intrinsicContentSize: CGSize {
         contentSize
    }
}

public class FullWidthCollectionViewCell: UICollectionViewCell {
     public override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
     ) -> CGSize {
            var targetSize = targetSize
            targetSize.height = CGFloat.greatestFiniteMagnitude
            
            let size = super.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
            
            return size
        }
}
