//
//  WordModel.swift
//  DefinedWords
//
//  Created by Valerie on 2/20/16.
//  Copyright © 2016 hdinh. All rights reserved.
//

import Foundation
import RealmSwift
class WordModel: Object {
    dynamic var word = ""
    dynamic var searchedDate = NSDate()
}
