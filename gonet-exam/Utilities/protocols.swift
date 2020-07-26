//
//  protocols.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation
import UIKit

protocol VideoGamesControllerProtocol: class {
    var MainController: UIViewController? {get set}
    var documentsArray: [Document] {get set}
    func getDocuments()
}

protocol VideoGamesCellControllerProtocol: class {
    func loadData(_ videoGameData: Document)
}

protocol ThreadsControllerProtocol: class {
    var mainController: UIViewController? {get set}
    var threadsArray: [String] {get set}
    func startThreads(_ sender: UIButton)
    func cleanThreads(_ sender: UIButton)
    func hiddeActiviIndicator()
    func showActivityIndicator()
    func executeThreads()
    func presentDataThreads(threadsArray: [String])
}
