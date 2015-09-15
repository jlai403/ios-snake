//
//  HighScoreEntry.swift
//  ios-snake
//
//  Created by Joey Lai on 2015-09-11.
//  Copyright (c) 2015 Joey Lai. All rights reserved.
//

import Foundation
import CoreData

@objc(HighScoreEntry)
public class HighScoreEntry: NSManagedObject {

    @NSManaged public var username: String
    @NSManaged public var score: NSNumber

}
