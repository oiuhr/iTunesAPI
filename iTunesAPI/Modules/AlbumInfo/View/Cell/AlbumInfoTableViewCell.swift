//
//  AlbumInfoTableViewCell.swift
//  iTunesAPI
//
//  Created by Ryzhov Eugene on 03.12.2020.
//

import UIKit

class AlbumInfoTableViewCell: UITableViewCell {
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(track: Song) {
        contentView.backgroundColor = .black
        textLabel?.font = UIFont.regularWithSize(size: 18)
        textLabel?.textColor = .lightGray
        textLabel?.text = track.trackName
    }
    
    override func prepareForReuse() {
        textLabel?.text = ""
    }
    
}
