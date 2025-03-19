//
//  PullRequestCell.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import UIKit

final class PullRequestCell: UITableViewCell {
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        return stack
    }()
    
    lazy var userHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    lazy var userVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        return stack
    }()
    
    lazy var titlePullRequest: UILabel = {
        let title = UILabel()
        title.text = "title"
        title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return title
    }()
    
    lazy var descriptionPullRequest: UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12, weight: .semibold)
        description.text = "description"
        return description
    }()
    
    lazy var photoUser: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .gray
        return photo
    }()
    
    lazy var userName: UILabel = {
        let user = UILabel()
        user.text = "name user"
        user.font = .systemFont(ofSize: 12, weight: .bold)
        return user
    }()
    
    lazy var datePR: UILabel = {
        let date = UILabel()
        date.font = .systemFont(ofSize: 10, weight: .semibold)
        date.text = "20/02/2025"
        return date
    }()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach({ $0.removeFromSuperview() })
    }
    func setupCell(model: PullRequestModel?) {
        setupView()
        guard let model = model else { return }
        titlePullRequest.text = model.title
        descriptionPullRequest.text = model.body
        photoUser.renderImageView(urlImage: model.user?.avatarUrl ?? "")
        userName.text = model.user?.login
        datePR.text = model.createdAt?.toDayMonthYearFormat()
    }
}


extension PullRequestCell: ViewLayoutHelper {
    func buildViewHierarchy() {
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titlePullRequest)
        mainStackView.addArrangedSubview(descriptionPullRequest)
        mainStackView.addArrangedSubview(userHorizontalStackView)
        
        userHorizontalStackView.addArrangedSubview(photoUser)
        userHorizontalStackView.addArrangedSubview(userVerticalStackView)
        
        userVerticalStackView.addArrangedSubview(userName)
        userVerticalStackView.addArrangedSubview(datePR)
    }
    
    func setupContraints() {
        mainStackView.anchorTo(superview: contentView)
        
        userHorizontalStackView.anchor(left: mainStackView.leftAnchor, bottom: mainStackView.bottomAnchor, leftConstant: 10, bottomConstant: 10)
        
        userVerticalStackView.anchor(bottom: mainStackView.bottomAnchor, bottomConstant: 10)
        
        photoUser.anchor(widthConstant: 30, heightConstant: 30)
        
        titlePullRequest.anchor(top: mainStackView.topAnchor, topConstant: 10)
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
    
    
}
