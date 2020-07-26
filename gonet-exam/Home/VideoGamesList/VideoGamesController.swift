//
//  VideoGamesController.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import UIKit
import FirebaseFirestore

class VideoGamesController: UICollectionViewCell {
    
    @IBOutlet weak var videoGamesTableView: UITableView!

    weak var MainController: UIViewController?
    
    var documentsArray: [Document] = []
    var db: Firestore!
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        self.db = Firestore.firestore()
        self.getDocuments()
    }
}

extension VideoGamesController: UITableViewDataSource, UITableViewDelegate, VideoGamesControllerProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentsArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navController = VideoGamesController.mainStoryboard.instantiateViewController(identifier: "details") as! DetailsController
        navController.modalPresentationStyle = .automatic
        navController.modalTransitionStyle = .coverVertical
        if let presenter = MainController {
            navController.gameData = documentsArray[indexPath.row]
            presenter.present(navController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGamesCell") as! VideoGamesCellController
        cell.loadData(documentsArray[indexPath.row])
        return cell
    }
    
    func getDocuments() {
        db.collection("videogames").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do{
                        let documentItem = try Document(dictionary: document.data())
                        self.documentsArray.append(documentItem)
                    }catch {
                        print("error")
                    }
                }
                self.videoGamesTableView.reloadData()
            }
        }
    }
}
