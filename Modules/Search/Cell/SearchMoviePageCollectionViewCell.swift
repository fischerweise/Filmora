//
//  SearchMoviePageCollectionViewCell.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit

class SearchMoviePageCollectionViewCell: UICollectionViewCell, ReusableCell{

    lazy var cellImage: UIImageView = {
        let imageView: UIImageView = UIImageView.newAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleTextLabel: UILabel = {
        let label: UILabel = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = Avenir.demibold.of(size: 20.0)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cellImage)
        contentView.addSubview(titleTextLabel)
        makeLayout()
    }
    
    
    public func loadCell(movie: Movie?){
        if let posterPath = movie?.backdropPath{
            cellImage.setFromApi(posterPath, placeholder: nil, showActivityIndicator: true)
        }
        titleTextLabel.text = movie?.title
    }
    
    func makeLayout() {
        cellImage.autoPinEdgesToSuperviewEdges()
        titleTextLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        titleTextLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        titleTextLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


