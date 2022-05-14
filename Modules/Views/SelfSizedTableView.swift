//
//  SelfSizedTableView.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 27.04.2022.
//

import UIKit

class SelfSizedTableView: UITableView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height {
        didSet { self.invalidateIntrinsicContentSize() }
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: self.bounds.width, height: height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.invalidateIntrinsicContentSize()
    }
}
