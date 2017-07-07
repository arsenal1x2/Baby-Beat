//
//  HomeViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/3/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit
import AVFoundation
class HomeViewController: UIViewController,AVAudioRecorderDelegate {
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var uiscrollview: UIScrollView!
    @IBOutlet weak var buttonHowToRecord: UIButton!
    @IBOutlet weak var labelRecording: UILabel!
    @IBOutlet weak var buttonMyRecord: UIButton!
    @IBOutlet weak var viewTutorial: UIView!
    @IBOutlet weak var buttontabToRecord: UIButton!
    @IBOutlet weak var superView: UIView!
    var recorder: AVAudioRecorder!
    var player:AVAudioPlayer!
    var meterTimer:Timer!
    var soundFileURL:URL!
    var isRecording:Bool = false
    var listRecorted:[String] = [String]()
    @IBAction func showViewTutorial(_ sender: Any) {
        setView(view: superView, hidden: true)
        setView(view: viewTutorial, hidden: false)
    }
    @IBAction func closeViewTutorial(_ sender: Any) {
        setView(view: superView, hidden: false)
        setView(view: viewTutorial, hidden: true)
    }
    @IBAction func tabToRecord(_ sender: Any) {
        if(isRecording){
           stopRecord()
           moveToChageVoice()
        }else{
          record()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initView()
    }
    override func viewDidLoad() {
        setSessionPlayback()
        askForNotifications()
        checkHeadphones()
        
        
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.isHidden = true
        addScrollView()
    }
    @IBOutlet weak var imageBackground: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMyRecorded(_ sender: Any) {
//        if(listRecorted.count == 0){
//            let alert:UIAlertController = UIAlertController(title: "MyRecordings folder is empty!", message: "", preferredStyle: .alert)
//            let buttonOk:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alert.addAction(buttonOk)
//            self.present(alert, animated: true, completion: nil)
//        }else{
            showListMyRecord()
        //}
    }
    override func viewDidDisappear(_ animated: Bool) {
        initView()
    }
}
extension HomeViewController{
    
    
    // init and custom interface
   func initView(){
        buttonMyRecord.layer.cornerRadius =  17
        buttonHowToRecord.layer.cornerRadius = 17
    viewTutorial.isHidden = true
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "listRecored") as! ListRecoredViewController
        self.present(vc,animated: true, completion: nil)
       
    }
    func moveToChageVoice(){
       // self.navigationController?.pushViewController(vc, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! CustomVoiceViewController
        self.present(vc,animated: true,completion: nil)
    }
    func addScrollView(){
        let imageWidth:CGFloat = self.view.frame.size.width
        let imageHeight:CGFloat = 147
        var yPosition:CGFloat = uiscrollview.bounds.origin.y
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
        
       uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
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
        
        scrollViewContentSize += imageHeight + 10
        yPosition += imageHeight + 10
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
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
        
        yPosition += imageHeight + spacer
        scrollViewContentSize += imageHeight +  spacer
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
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
        
        scrollViewContentSize += imageHeight + 10
        yPosition += 100 + 20
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
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
        
        yPosition += 350 + spacer
        scrollViewContentSize += imageHeight +  spacer
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
        //add label 4
        label4.text = "If you still can't hear your baby heartbeat don't worry it doesn't mean anything is wrong with your baby. Wait for someday and try again to record."
        label4.frame.size.width = imageWidth
        label4.frame.size.height = 120
        label4.numberOfLines = 0
        label4.textAlignment = .center
        label4.textColor = UIColor.white
        label4.center = self.view.center
        label4.frame.origin.y = yPosition
        uiscrollview.addSubview(label4)
        
        scrollViewContentSize += 40
        yPosition += 40
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
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
        
        scrollViewContentSize += 140
        yPosition += 140
        uiscrollview.contentSize = CGSize(width: imageWidth+10, height: scrollViewContentSize)
    
    }
}
extension HomeViewController{
    func stopRecord(){
        labelTime.isHidden = true
        labelRecording.isHidden = true
        isRecording = false
        buttontabToRecord.setBackgroundImage(UIImage(named:"tabtorecord.png"), for: .normal)
        recorder?.stop()
        player?.stop()
        
        meterTimer.invalidate()
        
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(false)
            
        } catch {
            print("could not make session inactive")
            print(error.localizedDescription)
        }

        moveToChageVoice()
    
    }
    func record(){
       labelTime.isHidden = false
       labelRecording.isHidden = false
        isRecording = true
        recordWithPermission(true)
        buttontabToRecord.setBackgroundImage(UIImage(named:"taptostop.png"), for: .normal)
    }
    func setSessionPlayback() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
            
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    
    func setSessionPlayAndRecord() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    func checkHeadphones() {
        print("\(#function)")
        
        // check NewDeviceAvailable and OldDeviceUnavailable for them being plugged in/unplugged
        let currentRoute = AVAudioSession.sharedInstance().currentRoute
        if currentRoute.outputs.count > 0 {
            for description in currentRoute.outputs {
                if description.portType == AVAudioSessionPortHeadphones {
                    print("headphones are plugged in")
                    break
                } else {
                    print("headphones are unplugged")
                }
            }
        } else {
            print("checking headphones requires a connection to a device")
        }
    }
}
extension HomeViewController{
    func askForNotifications() {
        print("\(#function)")
        
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(HomeViewController.background(_:)),
                                               name:NSNotification.Name.UIApplicationWillResignActive,
                                               object:nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(HomeViewController.foreground(_:)),
                                               name:NSNotification.Name.UIApplicationWillEnterForeground,
                                               object:nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(HomeViewController.routeChange(_:)),
                                               name:NSNotification.Name.AVAudioSessionRouteChange,
                                               object:nil)
    }
    
    func background(_ notification:Notification) {
        print("\(#function)")
        
    }
    
    func foreground(_ notification:Notification) {
        print("\(#function)")
        
    }
    
    
    func routeChange(_ notification:Notification) {
        print("\(#function)")
        
        if let userInfo = (notification as NSNotification).userInfo {
            print("routeChange \(userInfo)")
            
            //print("userInfo \(userInfo)")
            if let reason = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt {
                //print("reason \(reason)")
                switch AVAudioSessionRouteChangeReason(rawValue: reason)! {
                case AVAudioSessionRouteChangeReason.newDeviceAvailable:
                    print("NewDeviceAvailable")
                    print("did you plug in headphones?")
                    checkHeadphones()
                case AVAudioSessionRouteChangeReason.oldDeviceUnavailable:
                    print("OldDeviceUnavailable")
                    print("did you unplug headphones?")
                    checkHeadphones()
                case AVAudioSessionRouteChangeReason.categoryChange:
                    print("CategoryChange")
                case AVAudioSessionRouteChangeReason.override:
                    print("Override")
                case AVAudioSessionRouteChangeReason.wakeFromSleep:
                    print("WakeFromSleep")
                case AVAudioSessionRouteChangeReason.unknown:
                    print("Unknown")
                case AVAudioSessionRouteChangeReason.noSuitableRouteForCategory:
                    print("NoSuitableRouteForCategory")
                case AVAudioSessionRouteChangeReason.routeConfigurationChange:
                    print("RouteConfigurationChange")
                    
                }
            }
        }
    }
    func recordWithPermission(_ setup:Bool) {
        print("\(#function)")
        
        AVAudioSession.sharedInstance().requestRecordPermission() {
            [unowned self] granted in
            if granted {
                
                DispatchQueue.main.async {
                    print("Permission to record granted")
                    self.setSessionPlayAndRecord()
                    if setup {
                        self.setupRecorder()
                    }
                    self.recorder.record()
                    
                    self.meterTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                           target:self,
                                                           selector:#selector(self.updateAudioMeter(_:)),
                                                           userInfo:nil,
                                                           repeats:true)
                }
            } else {
                print("Permission to record not granted")
            }
        }
        
        if AVAudioSession.sharedInstance().recordPermission() == .denied {
            print("permission denied")
        }
    }
    func setupRecorder() {
        print("\(#function)")
        
        let format = DateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "Recording \(format.string(from: Date())).m4a"
        print(currentFileName)
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.soundFileURL = documentsDirectory.appendingPathComponent(currentFileName)
        print("writing to soundfile url: '\(soundFileURL!)'")
        
        if FileManager.default.fileExists(atPath: soundFileURL.absoluteString) {
            // probably won't happen. want to do something about it?
            print("soundfile \(soundFileURL.absoluteString) exists")
        }
        
        let recordSettings:[String : Any] = [
            AVFormatIDKey:             kAudioFormatAppleLossless,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey :      32000,
            AVNumberOfChannelsKey:     2,
            AVSampleRateKey :          44100.0
        ]
        
        
        do {
            recorder = try AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            recorder.delegate = self
            recorder.isMeteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
        } catch {
            recorder = nil
            print(error.localizedDescription)
        }
        
    }
    func updateAudioMeter(_ timer:Timer) {
        
        if let recorder = self.recorder {
            if recorder.isRecording {
                let min = Int(recorder.currentTime / 60)
                let sec = Int(recorder.currentTime.truncatingRemainder(dividingBy: 60))
                let s = String(format: "%02d:%02d", min, sec)
                labelTime.text = s
                recorder.updateMeters()
                // if you want to draw some graphics...
                //var apc0 = recorder.averagePowerForChannel(0)
                //var peak0 = recorder.peakPowerForChannel(0)
            }
        }
    }



}



