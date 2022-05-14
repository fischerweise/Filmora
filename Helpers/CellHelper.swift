//
//  CellHelper.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 28.04.2022.
//

import UIKit


public protocol ReusableCell: AnyObject {
    static var defaultReuseIdentifier: String { get }
    func makeLayout()
}

public extension ReusableCell where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}


public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableCell {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UICollectionReusableView>(ofKind: String, for indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}


