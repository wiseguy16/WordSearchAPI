//
//  ViewController.swift
//  WordSearchAPI
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func gotThePuzzle(thePuzzle: NSDictionary)
}

class ViewController: UIViewController,  UITextFieldDelegate, APIControllerProtocol
{
    
    @IBOutlet weak var rowsTextField: UITextField!
    
    @IBOutlet weak var columsTextField: UITextField!
    
    @IBOutlet weak var wordsToFindTextField: UITextField!
    
    var anApiController: APIController!
    var x: CGFloat = 10
    var y: CGFloat = 40
    var next1 = [String]()
    
    var longWord = "A B C D E F G H I J K L M N O P"   //P Q R S T U V W X Y Z"
    var longWord1 = "t,h,j,w,n,a,t,w,j,x,u,g,z,c,x,p,o,z,b,l"
    var longWord2 = "y,j,o,j,b,d,p,v,d,j,k,r,h,b,a,g,v,p,f,t"
    var longWord3 = "b,i,u,x,t,e,t,p,c,v,x,a,n,u,i,r,z,l,a,v"
    var longWord4 = "y,b,k,l,j,d,v,p,w,u,w,w,o,k,x,r,j,a,l,j"
    var longWord5 = "t,m,a,p,p,e,d,z,a,g,f,y,y,d,i,i,c,r,p,h"
    var longWord6 = "s,l,d,k,x,f,n,t,s,i,y,g,c,z,h,g,e,w,i,y"
    var longWord7 = "v,n,j,b,u,l,a,n,g,v,z,k,r,z,t,j,s,a,s,w"
    var longWord8 = "p,b,v,u,n,c,g,e,o,g,i,z,q,n,p,x,b,p,i,q"
    var longWord9 = "c,h,x,l,k,c,h,p,t,j,o,f,y,c,f,v,s,w,w,v"
    var longWord10 = "s,r,u,s,g,p,r,z,o,i,d,r,y,v,f,t,z,o,a,d"
    var longWord11 = "s,n,k,m,r,z,l,p,y,h,e,i,c,i,q,k,b,u,y,y"
    var longWord12 = "r,a,u,j,x,e,f,q,i,v,s,t,e,s,x,z,g,c,i,a"
    var longWord13 = "h,z,p,h,d,f,m,o,c,p,h,o,k,v,g,f,b,d,i,a"
    var longWord14 = "a,r,e,k,v,p,m,a,i,r,y,f,c,i,a,z,e,x,h,q"
    var longWord15 = "i,r,h,q,g,x,e,e,q,v,p,g,h,j,z,h,k,b,v,s"
    var longWord16 = "d,q,x,j,z,s,r,l,a,p,i,d,b,l,h,i,q,e,j,b"
    var longWord17 = "p,e,z,c,o,z,e,n,e,z,d,l,r,f,c,l,p,e,p,z"
    var longWord18 = "d,c,j,n,t,p,z,o,i,s,y,f,r,z,l,n,a,o,h,b"
    var longWord19 = "d,d,m,o,b,k,d,z,c,f,t,l,w,t,c,v,g,j,w,d"
    var longWord20 = "c,r,v,n,v,r,v,m,o,c,b,c,u,l,p,z,f,e,f,u"

    var rowsText: String = ""
    var columnText: String = ""
    var wordsText: String = ""
    var longWords = [String]()

    var lettersArray1 = [String]()
    var lettersArray2 = [String]()
    
    let boxXOffset: CGFloat = 17
    let boxWidth = 20
    let boxHeight = 20
    
    var arrayOfArrays = [[String]]()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        anApiController = APIController(delegate: self)
        anApiController.puzzleGetAPI()
        longWords = [longWord1, longWord2, longWord3, longWord4, longWord5, longWord6, longWord7, longWord8, longWord9, longWord10]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == rowsTextField
        {
            rowsText = rowsTextField.text!
            textField.delegate = self
            textField.resignFirstResponder()
          return true
        }
        else if textField == columsTextField
        {
            columnText = columsTextField.text!
            textField.delegate = self
            textField.resignFirstResponder()
            return true
        }
        else if textField == wordsToFindTextField!
        {
            wordsText = wordsToFindTextField.text!
            textField.delegate = self
            textField.resignFirstResponder()
        return true
        }
        else
        {

        return false
        }
    }

    @IBAction func testButton(sender: UIButton)
    {
      //  anApiController.delegate = self
       anApiController.puzzlePostAPI(rowsText, height: columnText, words: wordsText, minLength: "3", maxLength: "8", capabilities: ["comtheironyardcapabilityAngleBackwardsDownCapability",
                                      "comtheironyardcapabilityHorizontalCapability"])
        
        
       }
    
    
    func passInArray(list: String)
    {
        var wordArray = list.componentsSeparatedByString(",")
        //print(wordArray.count)
        // var x: CGFloat = 10
        // let y: CGFloat = 40
        
        for i in 0..<wordArray.count
        {
            let label = UILabel(frame: CGRectMake(0, 0, 17, 17))
            label.center = CGPointMake(x + boxXOffset, y)
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.purpleColor()
            label.textColor = UIColor.whiteColor()
            label.text = wordArray[i]
            self.view.addSubview(label)
            x = x + boxXOffset
            
        }

        resetXY()
    }
    
    func resetXY()
    {
        x = 10
        y = y + boxXOffset
    }
    
    
    
    @IBAction func makePuzzleTapped(sender: UIButton)
    {
        passInArray(longWord1)
        passInArray(longWord2)
        passInArray(longWord3)
        passInArray(longWord4)
        passInArray(longWord5)
        passInArray(longWord6)
        passInArray(longWord7)
        passInArray(longWord8)
        passInArray(longWord9)
        passInArray(longWord10)
        passInArray(longWord11)
        passInArray(longWord12)
        passInArray(longWord13)
        passInArray(longWord14)
        passInArray(longWord15)
        passInArray(longWord16)
        passInArray(longWord17)
        passInArray(longWord18)
        passInArray(longWord19)
        passInArray(longWord20)
        
        
        
    }
    
    func gotThePuzzle(thePuzzle: NSDictionary)
    {
       // print("\(thePuzzle)")
        
        let array1 = thePuzzle["puzzle"] as! NSArray
        
        print(array1)
        

        
        for x1 in 0..<array1.count
        {
           let componentsArray = array1[x1]
            lettersArray1.append("\(componentsArray)")
            
        }
        
        for y1 in 0..<lettersArray1.count
        {
            next1 = lettersArray1[y1].componentsSeparatedByString("\n")
            
           
        }
 
    }

}











