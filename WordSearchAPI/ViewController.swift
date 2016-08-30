//
//  ViewController.swift
//  WordSearchAPI
//
//  Created by Gregory Weiss on 8/30/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var anApiController = APIController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        anApiController.puzzleGetAPI()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

