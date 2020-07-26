//
//  DetailsController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var gameImg: UIImageView! {
        didSet {
            gameImg.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    
    var gameData: Document?

    override func viewDidLoad() {
        super.viewDidLoad()

        gameTitle.text = gameData?.name
        gameDescription.text = gameData?.description.replacingOccurrences(of: "\\n", with: "\n")
        if let img = gameData?.image {
            gameImg.loadImage(img)
            gameImg.contentMode = .scaleAspectFill
        }
    }
    @IBAction func backAction(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
