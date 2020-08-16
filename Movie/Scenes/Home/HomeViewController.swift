//
//  MovieListViewController.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import Lottie

protocol HomeViewControllerInterface: class {
    func setupUI()
    func reloadData()
    func showFailureMessage(error: Error)
}

class HomeViewController: BaseViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var searchView: SearchBarView!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            self.collectionView.registerNib(witClassAndIdentifier: MovieResultCollectionViewCell.self)
        }
    }
    
    var presenter: HomePresenterInterface!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.viewDidAppear()
        handleSearchMovie()

    }
    
}

extension HomeViewController: HomeViewControllerInterface {
    func showFailureMessage(error: Error) {
        self.showPopup(title: "", message: error.localizedDescription)
    }

    func setupUI(){
        self.title = "Home".localized
        UIHelper.hideHUD()
        searchView.setupUI()
        lottieAnimation()
    }
    
    func handleSearchMovie(){
        searchView.textfieldChange = {[weak self] searchText in
            guard  let self = self else {return}
            self.presenter.searchMovie(with: searchText)
        }
    }

    func reloadData(){
        self.collectionView.reloadData()
        //Lottie animation show/hide
        animationView.isHidden = presenter.numberOfItems() > 0 ? true : false
        
        if presenter.numberOfItems() == 0 && searchView.searchTextfield.text != ""{
            self.showPopup(title: "Oh no!", message: "Where is the movie Lebowski?\nWhere is the movie?!")
        }
        
        let clear = clearButton()
        navigationItem.rightBarButtonItem = presenter.numberOfItems() > 0 ? clear : nil
    }
    
    func clearButton()-> UIBarButtonItem {
        let clear = UIBarButtonItem(title: "Clear", style: .done, target: self, action: #selector(handleClearData))
        let font = UIFont.systemFont(ofSize: 14, weight: .bold)
        clear.setTitleTextAttributes([NSAttributedString.Key.font : font],
                                     for: .normal)
        return clear
    }
    
    @objc func handleClearData(){
        self.searchView.searchTextfield.text = ""
        self.presenter.searchMovie(with: "")
    }

    func lottieAnimation(){
          animationView.contentMode = .scaleAspectFit
          animationView.loopMode = .loop
          animationView.play()
    }
}

extension HomeViewController : UICollectionViewDelegate {}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withClassAndIdentifier: MovieResultCollectionViewCell.self, for: indexPath)
        let data = self.presenter.getMovieData()
        cell.configure(with: data?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.didSelectItemAt(row: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: Constants.CellHeight.movieResultCellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
