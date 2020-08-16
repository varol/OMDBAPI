//
//  UIHelper.swift
//  Movie
//
//  Created by Varol on 15.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import SVProgressHUD

class UIHelper: NSObject {
    static func showHUD() {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    static func hideHUD() {
        SVProgressHUD.dismiss()
    }
}
