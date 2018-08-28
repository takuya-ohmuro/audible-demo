//
//  PageCell.swift
//  audible
//
//  Created by 大室拓也 on 2018/04/14.
//  Copyright © 2018年 taku9321. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page:Page? {
        didSet {
            guard let page = page else {
                return
            }
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            imageView.image = UIImage(named: imageName)
            
            let color = UIColor(white:0.2,alpha:1)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20, weight: .medium),NSAttributedStringKey.foregroundColor:color])
            attributedText.append(NSMutableAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize:14),NSAttributedStringKey.foregroundColor:color]))

            let paragrahStyle = NSMutableParagraphStyle()
            paragrahStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragrahStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor.yellow
        iv.clipsToBounds = true
        iv.image = UIImage(named: "page1")
        return iv
    }()
    
    let textView:UITextView = {
        let tv = UITextView()
        tv.text = "Sample text for now"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    let lineSeparatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white:0.9,alpha:1)
        return view
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        imageView.anchorToTop(top:topAnchor , left: leftAnchor, bottom:textView.topAnchor, right: rightAnchor)
       // textView.anchorToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeparatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
