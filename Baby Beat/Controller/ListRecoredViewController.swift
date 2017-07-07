//
//  ListRecoredViewController.swift
//  Baby Beat
//
//  Created by may985 on 7/7/17.
//  Copyright © 2017 may985. All rights reserved.
//

import UIKit
import AVFoundation
class ListRecoredViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var recordTableView: UITableView!
    var recordings = [URL]()
    var player:AVAudioPlayer!
    var isPlaying = false
    override func viewDidLoad() {
        recordTableView.dataSource = self
        recordTableView.delegate = self
        listRecordings()
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
extension ListRecoredViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = recordTableView.dequeueReusableCell(withIdentifier: "cell") as! RecordTableViewCell
        
       var arrName =  recordings[indexPath.row].lastPathComponent.components(separatedBy: " ")
        var arrDate = arrName[1].components(separatedBy: ".m4a")
        cell.labelNameRecord.text = arrName[0]
        cell.labelDateTime.text = arrDate[0]
        cell.buttonDelete.tag = indexPath.row
         cell.buttonDelete.addTarget(self, action: #selector(ListRecoredViewController.askToDelete(_:)), for: UIControlEvents.touchUpInside)
        cell.buttonPlay.tag = indexPath.row
        cell.buttonPlay.addTarget(self, action: #selector(ListRecoredViewController.playBack(sender:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    func playBack(sender:UIButton!) {
        if(isPlaying){
            player.stop()
            sender.setBackgroundImage(UIImage(named:"play-button (2)"), for: .normal)
            
            isPlaying = false
            print("stop")
        }else{
          play(recordings[sender.tag])
            sender.setBackgroundImage(UIImage(named:"stop"), for: .normal)
            recordTableView.reloadData()
            isPlaying = true
            print("play")
        }
       // play(recordings[sender.tag])
    }
   
    func listRecordings() {
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: documentsDirectory,
                                                                   includingPropertiesForKeys: nil,
                                                                   options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles)
            self.recordings = urls.filter( { (name: URL) -> Bool in
                return name.lastPathComponent.hasSuffix("m4a")
            })
            
        } catch {
            print(error.localizedDescription)
            print("something went wrong listing recordings")
        }
        
    }
  
    func askToDelete(_ sender:UIButton) {
        
        print(sender.tag)
        let alert = UIAlertController(title: "Delete",
                                      message: "Delete Recording \(recordings[sender.tag].lastPathComponent)?",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            print("yes was tapped \(self.recordings[sender.tag])")
            self.deleteRecording(self.recordings[sender.tag])
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: {action in
            print("no was tapped")
        }))
        self.present(alert, animated:true, completion:nil)
    }
    func deleteRecording(_ url:URL) {
        
        print("removing file at \(url.absoluteString)")
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(at: url)
        } catch {
            print(error.localizedDescription)
            print("error deleting recording")
        }
        
        DispatchQueue.main.async() {
            self.listRecordings()
            self.recordTableView?.reloadData()
        }
    }
    func play(_ url:URL) {
        print("playing \(url)")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.volume = 1.0
            player.play()
        } catch {
            self.player = nil
            print(error.localizedDescription)
            print("AVAudioPlayer init failed")
        }
        
    }



}
