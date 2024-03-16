import UIKit
import AVFoundation

class SongPageViewController: UIViewController {
    
    var song : AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var songCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var songName = ""
        
        let bs = UIImageView(image: UIImage(named: "bsCover.png")!)
        let nggyu = UIImageView(image: UIImage(named: "nggyuCover.png")!)

        switch (category) {
        case 3 :
            songName = "song1"
            songNameLbl.text = "Brawl Stars"
            songCover.image = bs.image
        case 4 :
            songName = "song2"
            songNameLbl.text = "Never Gonna Give You Up"
            songCover.image = nggyu.image
        default :
            songName = "song2"
            songNameLbl.text = "Never Gonna Give You Up"
            songCover.image = nggyu.image
        }
        
        if let str = Bundle.main.url(forResource: songName, withExtension: "mp3")?.relativeString {
            if let url = URL(string: str) {
                song = try! AVAudioPlayer(contentsOf: url)
                song.prepareToPlay()
                song.volume = 0.1
            }
        }
    }
    
    
    @IBAction func playPauseBtn(_ sender: Any) {
        let btn = sender as! UIButton
        
        if song.isPlaying {
            song.stop()
            btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        
        else {
            song.play()
            btn.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        }
    }
    
    
    @IBAction func volumeUpBtn(_ sender: Any) {
        if song.volume < 1 {
            song.volume += 0.1
            progressBar.progress += 0.1
        }
        // fix volume if more than 1😎
        if song.volume > 1 {
            song.volume = 1
        }
    }
    
    
    @IBAction func volumeDownBtn(_ sender: Any) {
        if song.volume >= 0 {
            song.volume -= 0.1
            progressBar.progress -= 0.1
        }
        // fix volume if less than 0😋
        if song.volume < 0 {
            song.volume = 0
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        song.stop()
        
        let new = storyboard?.instantiateViewController(withIdentifier: "SongsViewController") as! SongsViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
