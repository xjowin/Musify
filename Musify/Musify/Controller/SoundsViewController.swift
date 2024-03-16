import UIKit
import AVFoundation

class SoundsViewController: UIViewController {
    
    var sound : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func soundBtn(_ sender: Any) {
        var name = ""
        let tag = (sender as! UIButton).tag
        
        switch (tag) {
        case 1 :
            name = "sound1"
        case 2 :
            name = "sound2"
        default :
            name = "sound2"
        }

        if let str = Bundle.main.url(forResource: name, withExtension: "mp3")?.relativeString {
            if let url = URL(string: str) {
                sound = try! AVAudioPlayer(contentsOf: url)
                sound.play()
            }
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        sound.stop()
        
        let new = storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)        
    }
    
}
