//
//  HomeViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/3/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!

   
    @IBOutlet weak var buttontabToRecord: UIButton!
    
    var viewTutorial:UIView!
    
    @IBOutlet weak var buttonMyRecord: UIButton!
    @IBOutlet weak var buttonHowToRecord: UIButton!
    var listRecorted:[String] = [String]()
    override func viewDidLoad() {
        initView()
        initViewTutorial()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tabToRecord(_ sender: Any) {
        
        moveToChageVoice()
    }
    
    @IBAction func closeViewInformation(_ sender: Any) {
        setView(view: viewTutorial, hidden: true)
    }
    @IBAction func showTutorialView(_ sender: Any) {
        setView(view: viewTutorial, hidden: false)
    }
    @IBAction func showMyRecord(_ sender: Any) {
        if(listRecorted.count == 0){
            let alert:UIAlertController = UIAlertController(title: "MyRecordings folder is empty!", message: "", preferredStyle: .alert)
            let buttonOk:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(buttonOk)
            self.present(alert, animated: true, completion: nil)
        }else{
            showListMyRecord()
        }
    }
}
extension HomeViewController{
    //init view tutorial
   func initViewTutorial(){
      //  viewTutorial = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
    viewTutorial = UIView()
    viewTutorial.backgroundColor = UIColor.black
    viewTutorial.translatesAutoresizingMaskIntoConstraints = true
    view.addSubview(viewTutorial)
    let leadingContraint =  NSLayoutConstraint(item: viewTutorial, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20)
    let trailingContraint =  NSLayoutConstraint(item: viewTutorial, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 20)
    let topContraint = NSLayoutConstraint(item: viewTutorial, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1.0, constant: 20)
    let bottomContraint =  NSLayoutConstraint(item: viewTutorial, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: 30)
    NSLayoutConstraint.activate([leadingContraint,trailingContraint,topContraint,bottomContraint])
    viewTutorial.isHidden = true
   }
    // init and custom interface
   func initView(){
        buttonMyRecord.layer.cornerRadius =  17
        buttonHowToRecord.layer.cornerRadius = 17
        // animation button Tab to record
       UIView.animate(withDuration: 1, delay: 0.1, options: [.repeat,.allowUserInteraction], animations: {
                self.buttontabToRecord.transform = CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6)
            }, completion: { (finish) in
                UIView.animate(withDuration: 0.6, animations: {
                self.buttontabToRecord.transform = CGAffineTransform.identity
                })
        })
    
   }
    //Set animation show and hide once view
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: { _ in
            view.isHidden = hidden
        }, completion: nil)
    }
    func showListMyRecord(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! CustomVoiceViewController
        self.present(vc,animated: true, completion: nil)
       
    }
    func moveToChageVoice(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! CustomVoiceViewController
        self.present(vc,animated: true, completion: nil)
    }
}
