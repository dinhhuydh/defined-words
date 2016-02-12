//
//  WordManager.swift
//  DefinedWords
//
//  Created by hdinh on 2/12/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import UIKit

var wordManager: WordManager = WordManager()

class WordManager: NSObject {
    var words = [String]()
    
    func addWord(text: String) {
        words.append(text)
    }
    
    func loadWords() {
        // TODO load from persistence
        addWord("yesterday")
        addWord("tomorrow")
        addWord("sarvant")
        
    }
    
    // TODO load words by date, by month

}
