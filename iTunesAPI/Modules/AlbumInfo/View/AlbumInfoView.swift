//
//  AlbumInfoView.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import UIKit

class AlbumInfoView: UIViewController {
    
    var presenter: AlbumInfoPresenter!
    
    //MARK: - UI Elements
    
    let albumNameLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldWithSize(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let albumArtistLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.regularWithSize(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let albumGenreLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .lightGray
        label.font = UIFont.regularWithSize(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let albumReleaseDateLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .lightGray
        label.font = UIFont.regularWithSize(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let albumImage: UIImageView = {
        
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
        
    }()
    
    let tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    //MARK: - UI Setup
    
    func setupUI() {
        
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        
        view.addSubview(albumNameLabel)
        view.addSubview(albumArtistLabel)
        view.addSubview(albumGenreLabel)
        view.addSubview(albumReleaseDateLabel)
        view.addSubview(albumImage)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumImage.heightAnchor.constraint(equalToConstant: 250),
            albumImage.widthAnchor.constraint(equalToConstant: 250),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 15),
            albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            albumArtistLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor),
            albumArtistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            albumArtistLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            albumGenreLabel.topAnchor.constraint(equalTo: albumArtistLabel.bottomAnchor, constant: 10),
            albumGenreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            albumReleaseDateLabel.topAnchor.constraint(equalTo: albumGenreLabel.bottomAnchor),
            albumReleaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: albumReleaseDateLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    func setupNavigationBar() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func close() {
        presenter.closeButtonTapped()
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationBar()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AlbumInfoTableViewCell.self, forCellReuseIdentifier: "cell")
        presenter.getData(search: presenter.initialAlbumData.collectionId) {
            self.albumNameLabel.text = self.presenter.initialAlbumData.collectionName
            self.albumArtistLabel.text = "by \(self.presenter.initialAlbumData.artistName)"
            self.albumGenreLabel.text = "genre: \(self.presenter.albumData.primaryGenreName)"
            self.albumReleaseDateLabel.text = "release date: \(self.presenter.albumData.releaseDate)"
            
            guard let url = URL(string: self.presenter.initialAlbumData.collectionImage) else { return }
            self.albumImage.af.setImage(withURL: url)
            
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - TableViewDataSource

extension AlbumInfoView: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.albumData.trackList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlbumInfoTableViewCell
        cell.prepareForReuse()
        cell.configure(track: presenter.albumData.trackList[indexPath.item])
        
        return cell
    }

}

//MARK: - TableViewDataDelegate

extension AlbumInfoView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            self?.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
