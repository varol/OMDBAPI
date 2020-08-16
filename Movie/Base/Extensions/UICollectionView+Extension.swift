//
//  UICollectionView+Extension.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

extension UICollectionView {

    func registerNib<T>(witClassAndIdentifier:T.Type) {
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func registerNib<T>(witClassAndIdentifier:T.Type, forSupplementaryViewOfKind kind: String) {
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueCell<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
    
    func dequeueSupplementaryView<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath, kind: String) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
