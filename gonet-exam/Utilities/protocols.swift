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
