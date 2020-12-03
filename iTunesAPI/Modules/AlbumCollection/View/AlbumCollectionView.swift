//
//  ViewController.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 01.12.2020.
//

import UIKit

class AlbumCollectionView: UIViewController {
    
    var presenter: AlbumCollectionPresenter!
    
    //MARK: - UI Elements
    
    let searchBar: UISearchBar = {
        
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Search"
        searchBar.searchTextField.textColor = .lightGray
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
        
    }()
    
    let collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
        
    }()
    
    //MARK: - UI Setup
    
    func setupUI() {
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        collectionView.backgroundColor = .black
    }
    
    func setupNavigation() {
        
        setupSeachBar()
        navigationItem.titleView = searchBar
    }
    
    func setupSeachBar() {
        
        let toolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexSpace, doneButton], animated: true)
        toolbar.sizeToFit()
        
        searchBar.inputAccessoryView = toolbar
        
        searchBar.delegate = self
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigation()
        presenter.getData(search: "Vundabar") {
            self.collectionView.reloadData()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: "reuse")
    }
       
       @objc func doneButtonTapped() {
           searchBar.endEditing(true)
       }
    
}

//MARK: - SearchBarDelegate

extension AlbumCollectionView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter.getData(search: searchBar.searchTextField.text ?? "") {
            self.collectionView.reloadData()
        }
    }
    
}

//MARK: - CollectionViewDataSource

extension AlbumCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as! AlbumCollectionViewCell
        cell.prepareForReuse()
        cell.configure(album: presenter.data[indexPath.item])
        
        return cell
    }
    
}

//MARK: - CollectionViewDelegate

extension AlbumCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.tappedCell(indexPath: indexPath)
    }
    
}

//MARK: - CollectionView Layout

extension AlbumCollectionView: UICollectionViewDelegateFlowLayout {
    
    func getTrackCellSide() -> CGFloat {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellContainerWidth: CGFloat = screenWidth - 16.0 * 2 - 16.0 * 2
        return cellContainerWidth / CGFloat(2)
    }
    
    func getHeight(for width: CGFloat) -> CGFloat {
        return (width * 150) / 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = getTrackCellSide()
        
        return CGSize(width: side, height: getHeight(for: side))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24.0, left: 16.0, bottom: 24.0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
}

