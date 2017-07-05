//
//  CustomVoiceViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/3/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit


class CustomVoiceViewController: UIViewController {
    @IBOutlet weak var silderDepth: CustomSlider!

    @IBOutlet weak var sliderAmplyfy: CustomSlider!
    @IBOutlet weak var sliderExtraction: CustomSlider!
    @IBOutlet weak var sliderCrystallize: CustomSlider!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = false
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
       // buttonBack.layer.cornerRadius = 10
       // buttonSaveAndShare.layer.cornerRadius = 10
        sliderAmplyfy.setThumbImage(UIImage(named: "heart.png"), for: UIControlState.normal)
        sliderExtraction.setThumbImage(UIImage(named: "heart.png"), for: UIControlState.normal)
        sliderCrystallize.setThumbImage(UIImage(named: "heart.png"), for: UIControlState.normal)
        silderDepth.setThumbImage(UIImage(named: "heart.png"), for: UIControlState.normal)
        
    }
    }
