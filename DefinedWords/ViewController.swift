//
//  ViewController.swift
//  DefinedWords
//
//  Created by hdinh on 2/12/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var wordList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wordManager.loadWords()
        print("\(wordManager.words)")

        wordList.reloadData()
    }
    
    //returning to view
    override func viewWillAppear(animated: Bool) {
        print("\(wordManager.words.count)")
        wordList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(wordManager.words.count)")
        return wordManager.words.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:  "test")
        print("\(wordManager.words)")
        print("\(wordManager.words[indexPath.row])")
        cell.textLabel?.text = wordManager.words[indexPath.row]
        
        return cell
    }


}

