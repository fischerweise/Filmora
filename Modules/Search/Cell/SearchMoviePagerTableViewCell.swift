//
//  SearchMoviePagerTableViewCell.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 24.04.2022.
//

import UIKit
import PureLayout


protocol SearchMoviePagerCellProtocol: AnyObject {
    func navigateMovieDetail(with movieID: Int)
}

class SearchMoviePagerTableViewCell: UITableViewCell, ReusableCell {

    private var movies: [Movie]?
    weak var delegate: SearchMoviePagerCellProtocol?
    

    
    lazy var cellCollectionView: UICollectionView = {
        var collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = true
        collectionView.register(SearchMoviePageCollectionViewCell.self)
        
        return collectionView
    }()
    
    lazy var pageController: UIPageControl = {
        let pager: UIPageControl = UIPageControl()
        pager.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.4)
        return pager
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellCollectionView)
        contentView.addSubview(pageController)
        makeLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loadCell(movies: [Movie]?){
        self.movies = movies
        self.pageController.numberOfPages = movies?.count ?? 0
        self.cellCollectionView.reloadData()
    }
    
    func makeLayout() {
        cellCollectionView.autoPinEdgesToSuperviewEdges()
        pageController.autoAlignAxis(toSuperviewAxis: .vertical)
        pageController.autoPinEdge(toSuperviewEdge: .bottom)
        
        self.updateConstraints()
    }
}


extension SearchMoviePagerTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300)
    }
}

extension SearchMoviePagerTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchMoviePageCollectionViewCell = cellCollectionView.dequeueReusableCell(for: indexPath)
        cell.loadCell(movie: self.movies?[indexPath.row])
        return cell
    }
}


extension SearchMoviePagerTableViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = movies?[indexPath.row], let movieID = movie.id{
            delegate?.navigateMovieDetail(with: movieID)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2

        pageController.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}
