//
//  WordManager.swift
//  DefinedWords
//
//  Created by hdinh on 2/12/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import UIKit
import RealmSwift

var wordManager: WordManager = WordManager()

class WordManager: NSObject {
    var wordModels = [WordModel]() //FIXME: We may not need this array, can just directly use realm models.
    let realm = try! Realm()
    
    /**
     This method adds new word model to database. A word model has two properties (so far), first is the word itself and
     and second is the date the word is searched/added to database.
     @param text The word itself
     */
    func addWord(text: String) {
        //Create a word model
        let newWordModel = WordModel()
        newWordModel.word = text
        newWordModel.searchedDate = NSDate()
        
        // Add word model to Realm
        try!realm.write {
            realm.add(newWordModel)
        }
        wordModels.append(newWordModel)
    }
    
    /**
     This method loads all words from database and store them in word models array
     */
    func loadWords() {
        //Get word models from Realm
        let allWordModels = realm.objects(WordModel)
        
        //Add words to wordModels array
        for wordModel in allWordModels {
            wordModels.append(wordModel)
        }
    }
    
   
    /**
     This method deletes a word from database.
     @param: objectToDelete Word Model that we want to delete
    */
    func deleteWord(objectToDelete:WordModel){
        realm.beginWrite()
        realm.delete(objectToDelete)
        try! realm.commitWrite()
    }
    
    /**
     This method deletes a word at a given indexfrom database .
     @param: index Index of word to delete
     */
    func deleteWordAtIndex(index:Int){
        let objectToDelete = wordManager.wordModels[index] as WordModel
        deleteWord(objectToDelete)
        wordModels.removeAtIndex(index)
    }
    
    /**
    This method deletes all words from database
     */
    func deleteAllWords() {
        for wordModel in wordModels {
            //Delete words from database
            deleteWord(wordModel)
        }
        //Empty the word model array
        wordModels.removeAll()
    }
    
    
    //TODO: The following methods currently compare date and time to filter words, will fix it to compare date without time.
    //Also need to refactor
    /**
     This method returns words from a given date until today
     @param fromDate Starting date
     */
    func loadWordsFromDate(fromDate: NSDate){
        let predicate = NSPredicate(format: "searchedDate  >= %@", fromDate)
        let filteredWords = realm.objects(WordModel).filter(predicate)
        for wordModel in filteredWords {
            wordModels.append(wordModel)
        }
    }
    
    /**
     This method returns words searched on a given date
     @param byDate The date that words were searched
     */
    func loadWordsByDate(byDate: NSDate){
        let predicate = NSPredicate(format: "searchedDate  == %@", byDate)
        let filteredWords = realm.objects(WordModel).filter(predicate)
        for wordModel in filteredWords {
            wordModels.append(wordModel)
        }

    }
    
    


}

