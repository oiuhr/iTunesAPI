//
//  AlbumCollectionViewCell .swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 01.12.2020.
//

import UIKit
import AlamofireImage

class AlbumCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    
    let albumImage: UIImageView = {

        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    let albumLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.regularWithSize(size: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let albumArtistLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldWithSize(size: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - UI Setup
    
    func setupUI() {
        
        contentView.addSubview(albumImage)
        contentView.addSubview(albumArtistLabel)
        contentView.addSubview(albumLabel)
        
        NSLayoutConstraint.activate([
            albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            albumImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            albumImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            albumArtistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumArtistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            albumArtistLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 10),
            
            albumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            albumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            albumLabel.topAnchor.constraint(equalTo: albumArtistLabel.bottomAnchor),
        ])
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(album: Album) {
        
        if let imageUrl = URL(string: album.collectionImage) {
            albumImage.af.setImage(withURL: imageUrl)
        }
        albumLabel.text = album.collectionName
        albumArtistLabel.text = album.artistName
    }
    
    override func prepareForReuse() {
        self.albumImage.image = nil
        self.albumLabel.text = ""
        self.albumArtistLabel.text = ""
    }
    
}
