//
//  RepositoryCell.swift
//  Github-iOS
//
//  Created by Gabriel on 15/03/25.
//

import UIKit

final class RepositoryCell: UITableViewCell {
    
    //MARK: StackViews
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.alignment = .top
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.distribution = .fill
        stack.alignment = .leading
        stack.axis = .vertical
        return stack
    }()
    
    lazy var statusStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var forksStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 3
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var starsStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 3
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var userStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
        //MARK: Labels
    lazy var userName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return name
    }()
    
    lazy var fullName: UILabel = {
        let name = UILabel()
        name.numberOfLines = 1
        name.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return name
    }()
    
    lazy var nameRepository: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return name
    }()
    
    lazy var descriptionRepository: UILabel = {
        let description = UILabel()
        description.numberOfLines = 2
        description.lineBreakMode = .byTruncatingTail
        description.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return description
    }()
    
    lazy var numberForks: UILabel = {
        let number = UILabel()
        number.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return number
    }()
    
    lazy var numberStars: UILabel = {
        let number = UILabel()
        number.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return number
    }()
    
    //MARK: Image Views
    lazy var photoPerson: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 15
        photo.backgroundColor = .gray
        return photo
    }()
    
    lazy var imageForks: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "tuningfork")
        image.tintColor = .black
        return image
    }()
    
    lazy var imageStars: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .orange
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func setupCell(model: Repository?) {
        setupView()
        guard let model = model else { return }
        userName.text = model.owner?.login
        fullName.text = model.fullName
        nameRepository.text = model.name
        photoPerson.renderImageView(urlImage: model.owner?.avatarURL ?? "")
        descriptionRepository.text = model.description
        numberForks.text = "\(model.forks ?? 0)"
        numberStars.text = "\(model.stargazersCount ?? 0)"
        
    }
    
}

extension RepositoryCell: ViewLayoutHelper {
    func buildViewHierarchy() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(userStackView)
        
        textStackView.addArrangedSubview(nameRepository)
        textStackView.addArrangedSubview(descriptionRepository)
        textStackView.addArrangedSubview(statusStackView)
        
        statusStackView.addArrangedSubview(forksStackView)
        statusStackView.addArrangedSubview(starsStackView)
        
        forksStackView.addArrangedSubview(imageForks)
        forksStackView.addArrangedSubview(numberForks)
        
        starsStackView.addArrangedSubview(imageStars)
        starsStackView.addArrangedSubview(numberStars)
        
        userStackView.addArrangedSubview(photoPerson)
        userStackView.addArrangedSubview(userName)
        userStackView.addArrangedSubview(fullName)
        
    }
    
    func setupContraints() {
        mainStackView.anchorTo(superview: contentView)
        
        photoPerson.anchor(widthConstant: 30, heightConstant: 30)
        imageForks.anchor(widthConstant: 10, heightConstant: 10)
        imageStars.anchor(widthConstant: 10, heightConstant: 10)
        
        userStackView.anchor(widthConstant: 120)
        photoPerson.anchorCenterXToSuperview()
        
        nameRepository.anchor(left: textStackView.leftAnchor , leftConstant: 10)
        
        textStackView.anchor(bottom: mainStackView.bottomAnchor, bottomConstant: 10)
        userStackView.anchor(top: mainStackView.topAnchor, bottom: mainStackView.bottomAnchor, topConstant: 10, bottomConstant: 10)
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
