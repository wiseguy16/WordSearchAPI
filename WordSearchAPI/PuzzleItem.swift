//
//  PuzzleItem.swift
//  WordSearchAPI
//
//  Created by Gregory Weiss on 8/31/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import Foundation

class PuzzleItem
{
    var numberOfRows = ""
    var numberOfColumns = ""
    var lettersArrayOfArrays: [[String]]
    var wordSolutions: [String: AnyObject]
    var wordSolutionsArray2: [[String: AnyObject]]
    
    init(puzzleDict: [String: AnyObject])
    {
        let aPuzzleArray = puzzleDict["puzzle"]
        for i in 0..<aPuzzleArray!.count
        {
          lettersArrayOfArrays.append(aPuzzleArray![i])
        }
        
        let wordSolutionsArray1 = puzzleDict["words"]
        for j in 0..<wordSolutionsArray1!.count
        {
            wordSolutionsArray2.append(wordSolutionsArray1![i])
        }

    }
    
}
