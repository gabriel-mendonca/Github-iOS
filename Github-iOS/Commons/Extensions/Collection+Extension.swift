//
//  Collection+Extension.swift
//  Github-iOS
//
//  Created by Gabriel on 18/03/25.
//

import UIKit

extension Collection {
   
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
