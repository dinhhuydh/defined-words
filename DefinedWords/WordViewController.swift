//
//  WordViewController.swift
//  DefinedWords
//
//  Created by hdinh on 2/12/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import UIKit
import Foundation



class WordViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionText: UITextView!
    
    var word: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set up view if word exists
        if let word = word {
          wordLabel.text = word
//          let wordDefinition = DCSCopyTextDefinition(null, word, 0...word.length)
        }
        print("defininig...\(word)")
        if (UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(word!)) {
            print("exist")
            UIReferenceLibraryViewController.init(term: word!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
