//
//  ViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/5/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var uiscrollview: UIScrollView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        let imageWidth:CGFloat = view1.frame.width - 10
        let imageHeight:CGFloat = 147
        var yPosition:CGFloat = 0
        var scrollViewContentSize:CGFloat=0
        let spacer:CGFloat = 8
        let label:UILabel = UILabel()
       
        label.font = UIFont(name: "Futura-Bold", size: 12)
        
      //  let font = UIFont
        let label2:UILabel = UILabel()
        label2.font = UIFont(name: "Futura-Bold", size: 12)
        
        //label2.font = UIFont(name: UIFont.fontNames(forFamilyName: "Futara")[2], size: 14)
        let label3:UILabel = UILabel()
       label3.font = UIFont(name: "Futura-Bold", size: 12)
        let label4:UILabel = UILabel()
        label4.font = UIFont(name: "Futura-Bold", size: 12)
        let label5:UILabel = UILabel()
        label5.font = UIFont(name: "Futura-Bold", size: 12)
        
        //add label 1
        label.text = "It is possible to hear your baby's hearthbeat from as early as 19-20 weeks in pregnancy, but it's higher chance to hear it i the last trimester as the baby gets bigger and the hearbeat stronger"
        label.frame.size.width = imageWidth
        label.frame.size.height = 90
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.center = self.view.center
        label.frame.origin.y = yPosition
        uiscrollview.addSubview(label)
        scrollViewContentSize += 90 + spacer
        yPosition += 50 + spacer
        
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        // add label 2
        label2.text = "To record place you iPhone as shown in the picture, gently press on belly and tap button to start recording. When you want to finish recording tap again to stop recording"
        label2.frame.size.width = imageWidth
        label2.frame.size.height = imageHeight
        label2.numberOfLines = 0
        label2.textAlignment = .center
        label2.textColor = UIColor.white
        label2.center = self.view.center
        label2.frame.origin.y = yPosition
        uiscrollview.addSubview(label2)
        
        scrollViewContentSize += imageHeight + 10 - 20
        yPosition += imageHeight + 10 - 20
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        // add image view
        let myImage:UIImage = UIImage(named: "baby.png")!
        let myImageView:UIImageView = UIImageView()
        myImageView.image = myImage
        myImageView.contentMode = UIViewContentMode.scaleAspectFill
        myImageView.frame.size.width = imageWidth
        myImageView.frame.size.height = imageHeight
        myImageView.center = self.view.center
        myImageView.frame.origin.y = yPosition
        uiscrollview.addSubview(myImageView)
        
        yPosition += imageHeight + spacer - 20
        scrollViewContentSize += imageHeight +  spacer - 20
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        //add label 3
        label3.text = "if you don't hear your baby heart beat try other positions."
        label3.frame.size.width = imageWidth
        label3.frame.size.height = imageHeight
        label3.numberOfLines = 0
        label3.textAlignment = .center
        label3.textColor = UIColor.white
        label3.center = self.view.center
        label3.frame.origin.y = yPosition
        uiscrollview.addSubview(label3)
        
        scrollViewContentSize += imageHeight + 10 - 20
        yPosition += 100 + 10 - 20
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        //add image 1
        let myImage1:UIImage = UIImage(named: "born.png")!
        let myImageView1:UIImageView = UIImageView()
        myImageView1.image = myImage1
        myImageView1.contentMode = UIViewContentMode.scaleAspectFill
        myImageView1.frame.size.width = imageWidth
        myImageView1.frame.size.height = 392
        myImageView1.center = self.view.center
        myImageView1.frame.origin.y = yPosition
        uiscrollview.addSubview(myImageView1)
        
        yPosition += 350 + spacer - 20
        scrollViewContentSize += imageHeight +  spacer - 20
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        //add label 4
        label4.text = "If you still can't hear your baby heartbeat don't worry it doesn't mean anything is wrong with your baby. Wait for someday and try again to record."
        label4.frame.size.width = imageWidth
        label4.frame.size.height = imageHeight
        label4.numberOfLines = 0
        label4.textAlignment = .center
        label4.textColor = UIColor.white
        label4.center = self.view.center
        label4.frame.origin.y = yPosition
        uiscrollview.addSubview(label4)
        
        scrollViewContentSize += 100 + 10
        yPosition += 100 + 10
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
        //add label 5
        label5.text = "You can also try to record your hearbeat."
        label5.frame.size.width = imageWidth
        label5.frame.size.height = imageHeight
        label5.numberOfLines = 0
        label5.textAlignment = .center
        label5.textColor = UIColor.white
        label5.center = self.view.center
        label5.frame.origin.y = yPosition
        uiscrollview.addSubview(label5)
        
       scrollViewContentSize += 100
        yPosition += 100
        uiscrollview.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
