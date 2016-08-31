//
//  ViewController.swift
//  WordSearchAPI
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

protocol APIControllerProtoolDelegate
{
    func gotThePuzzle(thePuzzle: NSDictionary)
}

class ViewController: UIViewController, APIControllerProtoolDelegate
{
    var anApiController = APIController()
    
    var longWord = "A B C D E F G H I J K L M N O P"   //P Q R S T U V W X Y Z"
    
    let boxXOffset: CGFloat = 20
    let boxWidth = 20
    let boxHeight = 20
    //var crazyTuple: ([[String]], [[String: AnyObject]])
    
    var arrayOfArrays = [[String]]()
    
  //  var crazyTuple = ([[String]], [[String: AnyObject]])

    override func viewDidLoad()
    {
        super.viewDidLoad()
        anApiController.puzzleGetAPI()
        
//        
//        let label = UILabel(frame: CGRectMake(0, 0, 20, 20))
//        label.center = CGPointMake(30, 40)
//        label.textAlignment = NSTextAlignment.Center
//        label.backgroundColor = UIColor.purpleColor()
//        label.textColor = UIColor.whiteColor()
//        label.text = "I"
//        self.view.addSubview(label)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButton(sender: UIButton)
    {
       anApiController.puzzlePostAPI("20", height: "20", words: "10", minLength: "3", maxLength: "8", capabilities: ["comtheironyardcapabilityAngleBackwardsDownCapability",
                                      "comtheironyardcapabilityHorizontalCapability"])
        
        
        
      //  let mypzl = anApiController.aPuzzle
      //  print(mypzl)
        //let puzzlePart = crazyTuple.0
        //print(puzzlePart)
       // let wordsPart = crazyTuple.1
//        
//        for ar in 0..<puzzlePart.count
//        {
//            let aPart = puzzlePart[ar]
//            arrayOfArrays.append(aPart)
//        }
//        print(arrayOfArrays)
        
    }
    
    
    @IBAction func makePuzzleTapped(sender: UIButton)
    {
        let wordArray = longWord.componentsSeparatedByString(" ")
        //print(wordArray.count)
        var x: CGFloat = 10
        let y: CGFloat = 40
        
        for i in 0..<wordArray.count
        {
            let label = UILabel(frame: CGRectMake(0, 0, 20, 20))
            label.center = CGPointMake(x + boxXOffset, y)
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.purpleColor()
            label.textColor = UIColor.whiteColor()
            label.text = wordArray[i]
            self.view.addSubview(label)
            x = x + boxXOffset
         
            
        }
//        let myGuess = anApiController.longResponseString!
//        print(myGuess)
//        let letArray = myGuess.componentsSeparatedByString("[")
//      //  print(letArray)
        
        
    }
    
    func gotThePuzzle(thePuzzle: NSDictionary)
    {
        let aPuz = PuzzleItem(puzzleDict: thePuzzle as! [String : AnyObject])
//        for i in 0..<thePuzzle.count
//        {
//            let oneRow = thePuzzle[i]
//            arrayOfArrays.append(oneRow)
//        }
//        print(arrayOfArrays)
    }

}











