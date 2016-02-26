//
//  ViewController.swift
//  DefinedWords
//
//  Created by hdinh on 2/12/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var wordList: UITableView!
    @IBOutlet weak var newWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wordManager.loadWords()
       
    }
    
    //returning to view
    override func viewWillAppear(animated: Bool) {
        wordList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    /**
    This action adds a new word to the word list
    */
    @IBAction func addNewWord(sender: AnyObject) {
        //Only add word if the field is not empty
        if newWord.text?.characters.count > 0
        {
            //Add new word
            wordManager.addWord(newWord.text!)
            
            //Reload table view
            wordList.reloadData()
            
            //Clear new word text field
            newWord.text=""
        }
    }

    
//MARK: UITableViewDelegate
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            [self .deleteRowAtIndexPath(indexPath)]
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordManager.wordModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:  "test")
        cell.textLabel?.text = wordManager.wordModels[indexPath.row].word
        return cell
    }
    
    /**
    This method deletes row at a given index path, also deletes the contained record from database
    */
    func deleteRowAtIndexPath(indexPath: NSIndexPath) {
        wordManager.deleteWordAtIndex(indexPath.row)
        wordList.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

   
}

