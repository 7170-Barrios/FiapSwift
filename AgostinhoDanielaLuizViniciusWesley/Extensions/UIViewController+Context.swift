//
//  UIViewController+Context.swift
//  AgostinhoDanielaLuizViniciusWesley
//
//  Created by Agostinho José Schlindwein on 03/08/22.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
