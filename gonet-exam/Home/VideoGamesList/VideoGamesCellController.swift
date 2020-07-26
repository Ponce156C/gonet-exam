//
//  VideoGamesCellController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class VideoGamesCellController: UITableViewCell, VideoGamesCellControllerProtocol {
    
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    
    func loadData(_ videoGameData: Document) {
        title.text = videoGameData.name
        shortDescription.text = videoGameData.short_description.replacingOccurrences(of: "\\n", with: "\n")
        img.loadImage(videoGameData.image)
        img.contentMode = .scaleAspectFill
    }
}
