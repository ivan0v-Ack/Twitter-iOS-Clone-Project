//
//  Utilities.swift
//  Twitter iOS Clone Project
//
//  Created by Ivan Ivanov on 6/12/21.
//

import UIKit


class Utilities {
    
    func inputContainterView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = .white
        view.addSubview(iv)
        iv.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor, size: CGSize(width: 24, height: 24), padding: .init(top: 0, left: 8, bottom: 8, right: 0))
        view.addSubview(textField)
        textField.anchor(leading: iv.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 8, bottom: 8, right: 0))
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,size: CGSize(width: 0, height: 0.75), padding: .init(top: 0, left: 8, bottom: 0, right: 0))
        return view
    }
    
    func textField(withPlaceholder placeholder: String, isSecure: Bool)-> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.isSecureTextEntry = isSecure
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
    
        return button
    }
    
}
