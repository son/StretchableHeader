//
//  StretchHeaderLayout.swift
//  StretchableHeader
//
//  Created by Takeru Sato on 2018/12/26.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

final class StretchHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        attributes?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader && attribute.indexPath.section == 0 {
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 { return }
                let width = collectionView.frame.width
                let height = attribute.frame.height - contentOffsetY
                attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
