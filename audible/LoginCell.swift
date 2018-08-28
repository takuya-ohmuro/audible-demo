//
//  LoginCell.swift
//  audible
//
//  Created by takuyaOhmuro on 2018/05/02.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import UIKit

let logoImageView:UIImageView = {
    let image = UIImage(named: "logo")
    let imageView = UIImageView(image: image)
    return imageView
}()

let emailTextField:LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.placeholder = "Enter Email"
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.layer.borderWidth = 1
    textField.keyboardType = .emailAddress
    return textField
}()

let passwordTextField:LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.placeholder = "Enter Password"
    textField.layer.borderColor = UIColor.lightGray.cgColor
    textField.layer.borderWidth = 1
    textField.isSecureTextEntry = true
    return textField
}()

let loginButton:UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .orange
    button.setTitle("Log in", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
}()

class LoginCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        _ = logoImageView.anchor(centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -230, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        
        _ = emailTextField.anchor(logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 8, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
       
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32, widthConstant: 0, heightConstant: 50)
        
        
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y , width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y , width: bounds.width + 10, height: bounds.height)
    }
}
