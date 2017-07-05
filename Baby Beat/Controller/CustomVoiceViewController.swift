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

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var sliderAmplyfy: CustomSlider!
    @IBOutlet weak var sliderExtraction: CustomSlider!
    @IBOutlet weak var sliderCrystallize: CustomSlider!
    
    override func viewDidLoad() {
        let jeremyGif = UIImage.gifImageWithName("tumblr_mi4xstZpvi1rfsim9o4_500")
        imageView.image = jeremyGif
        //imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        //view.addSubview(imageView)
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
