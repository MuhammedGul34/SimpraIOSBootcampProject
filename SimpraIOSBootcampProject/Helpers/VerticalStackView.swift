//
//  VerticalStackView.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0){
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
        
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
