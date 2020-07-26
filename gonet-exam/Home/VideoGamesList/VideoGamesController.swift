//
//  VideoGamesController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit

class VideoGamesController: UICollectionViewCell {
    
    @IBOutlet weak var videoGamesTableView: UITableView!

    weak var MainController: UIViewController?
    
    var documentsArray: [Document] = []
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.getDocuments()
    }
}

extension VideoGamesController: UITableViewDataSource, UITableViewDelegate, VideoGamesControllerProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("segues")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGamesCell") as! VideoGamesCellController
        cell.loadData(documentsArray[indexPath.row])
        return cell
    }
    
    func getDocuments() {
        print("ad")
    }
}
