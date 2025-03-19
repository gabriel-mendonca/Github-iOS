//
//  ViewLayoutHelper.swift
//  Github-iOS
//
//  Created by Gabriel on 15/03/25.
//

import Foundation

protocol ViewLayoutHelper {
    
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewLayoutHelper {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
}
