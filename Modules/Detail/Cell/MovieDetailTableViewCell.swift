//
//  MovieDetailTableViewCell.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit

protocol MovieDetailTableViewCellDelegate: AnyObject {
    func addToWatchlistButton(_: MovieDetailTableViewCell)
}

class MovieDetailTableViewCell: UITableViewCell, ReusableCell {
    var delegate: MovieDetailTableViewCellDelegate?
    @objc func addToWatchlistButton(_ sender: UIButton) {
        self.delegate?.addToWatchlistButton(self)
       }
    var imbdID = ""

    lazy var cellImage: UIImageView = {
        let imageView: UIImageView = UIImageView.newAutoLayout()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleTextLabel: UILabel = {
        let label: UILabel = UILabel.newAutoLayout()
        label.font = Avenir.demibold.of(size: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var titleDescLabel: UILabel = {
        let label: UILabel = UILabel.newAutoLayout()
        label.font = Avenir.demibold.of(size: 16.0)
        label.numberOfLines = 0
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var starImage: UIImageView = {
        let imageView: UIImageView = UIImageView.newAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "favorite.png")
        return imageView
    }()
    
    lazy var starVoteLabel: UILabel = {
        let label: UILabel = UILabel.newAutoLayout()
        label.font = Avenir.regular.of(size: 16.0)
        label.numberOfLines = 0
        label.textColor = UIColor.lightGray
        return label
    }()
    
    lazy var relaseDateLabel: UILabel = {
        let label: UILabel = UILabel.newAutoLayout()
        label.font = Avenir.regular.of(size: 14.0)
        label.numberOfLines = 0
        label.textColor = UIColor.lightGray
        return label
    }()
    
    lazy var imdbButton: UIButton = {
        let imdbButton: UIButton = UIButton.newAutoLayout()
        imdbButton.contentMode = .scaleAspectFill
        imdbButton.setImage(UIImage(named: "imdb"), for: .normal)
        imdbButton.addTarget(self, action: #selector(goToIMDB), for: .touchUpInside)
        return imdbButton
    }()
    
    @objc func goToIMDB() {
        if let url = URL(string: "https://www.imdb.com/title/" + imbdID) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    lazy var addToWatchlistButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.contentMode = .scaleToFill
        button.setTitle("Add to Watchlist", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 14)
        button.layer.cornerRadius = 12
        button.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 2.1
        button.layer.shadowOpacity = 0.6
        button.setTitleColor(UIColor(red: 252/255, green: 255/255, blue: 178/255, alpha: 1.0), for: .normal)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addToWatchlistButton(_:)), for: .touchUpInside)
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImage)
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(titleDescLabel)
        contentView.addSubview(starImage)
        contentView.addSubview(starVoteLabel)
        contentView.addSubview(relaseDateLabel)
        contentView.addSubview(imdbButton)
        contentView.addSubview(addToWatchlistButton)
        makeLayout()
    }
    
    public func loadCell(movieDetail: MovieDetail?){
        if let movie = movieDetail{
            if let imagePath = movie.posterPath{
                self.cellImage.setFromApi(imagePath, placeholder: nil, showActivityIndicator: true)
            }
            self.titleTextLabel.text = movie.title
            self.titleDescLabel.text = movie.overview
            self.starVoteLabel.text = movie.voteAverage?.description
            self.relaseDateLabel.text = movie.releaseDate
        }
    }
    
    func makeLayout() {
        cellImage.autoPinEdge(toSuperviewEdge: .top)
        cellImage.autoPinEdge(toSuperviewEdge: .left)
        cellImage.autoPinEdge(toSuperviewEdge: .right)
        cellImage.autoSetDimension(.height, toSize: 300.0)
        
        titleTextLabel.autoPinEdge(.top, to: .bottom, of: cellImage, withOffset: 20.0)
        titleTextLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)
        titleTextLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        
        titleDescLabel.autoPinEdge(.top, to: .bottom, of: titleTextLabel, withOffset: 20.0)
        titleDescLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)
        titleDescLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        titleDescLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 50.0)
        
        imdbButton.autoSetDimension(.height, toSize: 50)
        imdbButton.autoSetDimension(.width, toSize: 50)
        imdbButton.autoPinEdge(toSuperviewEdge: .right, withInset: 15)
        imdbButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        relaseDateLabel.autoPinEdge(.right, to: .left, of: imdbButton, withOffset: -10)
        relaseDateLabel.autoAlignAxis(.horizontal, toSameAxisOf: imdbButton)
        
        starVoteLabel.autoPinEdge(.right, to: .left, of: relaseDateLabel, withOffset: -10)
        starVoteLabel.autoAlignAxis(.horizontal, toSameAxisOf: imdbButton)
        
        starImage.autoPinEdge(.right, to: .left, of: starVoteLabel, withOffset: -5)
        starImage.autoAlignAxis(.horizontal, toSameAxisOf: imdbButton)
        starImage.autoSetDimension(.height, toSize: 20)
        starImage.autoSetDimension(.width, toSize: 20)
        
        addToWatchlistButton.autoPinEdge(toSuperviewEdge: .left, withInset: 15)
        addToWatchlistButton.autoAlignAxis(.horizontal, toSameAxisOf: imdbButton)
        addToWatchlistButton.autoSetDimension(.height, toSize: 30)
        addToWatchlistButton.autoSetDimension(.width, toSize: 150)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
