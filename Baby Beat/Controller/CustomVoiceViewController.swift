//
//  CustomVoiceViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/3/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit


class CustomVoiceViewController: UIViewController {

    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonSaveAndShare: UIButton!
    override func viewDidLoad() {
        initView()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension CustomVoiceViewController{
    func initView(){
        buttonBack.layer.cornerRadius = 10
        buttonSaveAndShare.layer.cornerRadius = 10
    }
    }
