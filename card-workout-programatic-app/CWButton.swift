//
//  CWButton.swift
//  card-workout-programatic-app
//
//  Created by NTIPL on 27/04/25.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, title: String, buttonIconName: String) {
        super.init(frame: .zero)
        
//      add attributes to button configuration like size
        
        var attributedTitle = AttributedString(title)
        attributedTitle.font = UIFont.systemFont(ofSize: 20)
        
        configuration = .tinted()

        //      add attributes to button configuration
//      configuration?.attributedTitle = AttributedString(title, attributes:           AttributeContainer([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30)]))
        
        configuration?.attributedTitle = attributedTitle
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.image = UIImage(systemName: buttonIconName)
        configuration?.imagePadding = 5
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
