//
//  RecipeDetailController.swift
//  Recipes WatchKit Extension
//
//  Created by IJke Botman on 17/01/2018.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import WatchKit
import Foundation


class RecipeDetailController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let recipe = context as? Recipe {
            let rowTypes: [String] = ["RecipeHeader"] + recipe.steps.map({ _ in "RecipeStep"})
            table.setRowTypes(rowTypes)
            
            for i in 0..<table.numberOfRows {
                let row = table.rowController(at: i)
                if let header = row as? RecipeHeaderController {
                    header.titleLabel.setText(recipe.name)
                } else if let step = row as? RecipeStepController {
                    step.stepLabel.setText("\(i). " + recipe.steps[i - 1])
                }
            }
        }
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
