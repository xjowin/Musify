import UIKit

class SongsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func songBtn(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        category = tag
        
        let new = storyboard?.instantiateViewController(withIdentifier: "SongPageViewController") as! SongPageViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        let new = storyboard?.instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        new.modalPresentationStyle = .fullScreen
        self.present(new, animated: true)
    }
    
}
