//
//  EmptyView.swift
//  Github-iOS
//
//  Created by Gabriel on 19/03/25.
//

import UIKit

final class EmptyView: UIView {
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "folder.fill.badge.questionmark")
        icon.tintColor = .black
        return icon
    }()
    
    lazy var messageEmpty: UILabel = {
        let message = UILabel()
        message.textAlignment = .center
        message.numberOfLines = 0
        message.lineBreakMode = .byWordWrapping
        message.font = .systemFont(ofSize: 14, weight: .semibold)
        message.text = "Não há pull requests para esse repositorio."
        return message
    }()
    
    lazy var buttonUnderstand: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entendi", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(actionUnderstand), for: .touchUpInside)
        return button
    }()
    
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionUnderstand() {
        action?()
    }
}

extension EmptyView: ViewLayoutHelper {
    func buildViewHierarchy() {
        addSubview(iconImageView)
        addSubview(messageEmpty)
        addSubview(buttonUnderstand)
    }
    
    func setupContraints() {
        iconImageView.anchorCenterXToSuperview()
        iconImageView.anchor(top: topAnchor, topConstant: 200, widthConstant: 100, heightConstant: 100)
        
        messageEmpty.anchor(top: iconImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, rightConstant: 16)
        
        buttonUnderstand.anchor(top: messageEmpty.bottomAnchor, left: leftAnchor, right: rightAnchor, topConstant: 16, leftConstant: 45, rightConstant: 45)
    }
}
