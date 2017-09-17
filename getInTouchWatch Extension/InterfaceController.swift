//
//  InterfaceController.swift
//  getInTouchWatch Extension
//
//  Created by 倉成 智久 on 2017/09/16.
//  Copyright © 2017年 倉成 智久. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var myLabel: WKInterfaceLabel!
    @IBOutlet var tableView: WKInterfaceTable!
    
    let actions: [String] = ["遅刻", "半休", "全休", "在宅勤務"]
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        tableView.setNumberOfRows(actions.count, withRowType: "TableRowController")

        for (n, c) in actions.enumerated() {
            let row: TableRowController = tableView.rowController(at: n) as! TableRowController
            row.label.setText(c)
        }

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

//    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
//        self.pushController(withName: "reasonController", context: actions[rowIndex])
//    }
}
