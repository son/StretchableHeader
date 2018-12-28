//
//  HeaderView.swift
//  StretchableHeader
//
//  Created by Takeru Sato on 2018/12/26.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    
    private var imageView: UIImageView!
    private var visualEffectView: UIVisualEffectView!
    
    var animator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraint()
    }
    
    private func setupView() {
        backgroundColor = .red
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "stretchy_header")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
            self.visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
            self.visualEffectView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(self.visualEffectView)
            
            self.visualEffectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.visualEffectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            self.visualEffectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            self.visualEffectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        })
    }
    
    private func addConstraint() {
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
