import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        sleep(UInt32(1))
    }
    
    
    @IBAction func songsBtn(_ sender: Any) {
        let new = storyboard?.instantiateViewController(withIdentifier: "SongsViewController") as! SongsViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
    
    @IBAction func soundsBtn(_ sender: Any) {
        let new = storyboard?.instantiateViewController(withIdentifier: "SoundsViewController") as! SoundsViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
