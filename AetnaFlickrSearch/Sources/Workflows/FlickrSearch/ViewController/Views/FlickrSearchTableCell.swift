//
//  FlickrSearchTableCell.swift
//  AetnaFlickrSearch
//
//  Created by Corey Davis on 4/12/20.
//  Copyright © 2020 Corey Davis. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class FlickrSearchCell: UITableViewCell {
    
    private var flickrImage: UIImageView!
    private var title: UILabel!
    private var width: UILabel!
    private var height: UILabel!
    
    func configure(with item: FlickrItem) {
        applyDesign()

        let imageURL = URL(string: item.media.m)
        self.flickrImage?.kf.setImage(with: imageURL)
        self.title?.text = item.title
        self.height?.text = item.height()
        self.width?.text = item.width()
    }
    
    private func applyDesign() {
        flickrImage = UIImageView()
        flickrImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(flickrImage)
        
        NSLayoutConstraint.activate([
            flickrImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            flickrImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            flickrImage.heightAnchor.constraint(equalToConstant: 95),
            flickrImage.widthAnchor.constraint(equalToConstant: 95),
            flickrImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            flickrImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5)
        ])
        
        flickrImage.contentMode = .scaleAspectFit
        
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: flickrImage.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        title.adjustsFontSizeToFitWidth = true
        
        width = UILabel()
        width.translatesAutoresizingMaskIntoConstraints = false
        addSubview(width)
        
        NSLayoutConstraint.activate([
            width.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            width.leadingAnchor.constraint(equalTo: flickrImage.trailingAnchor, constant: 10),
            width.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        width.adjustsFontSizeToFitWidth = true
        
        height = UILabel()
        height.translatesAutoresizingMaskIntoConstraints = false
        addSubview(height)
        
        NSLayoutConstraint.activate([
            height.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            height.leadingAnchor.constraint(equalTo: flickrImage.trailingAnchor, constant: 10),
            height.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
        ])
        
        height.adjustsFontSizeToFitWidth = true
    }
}
