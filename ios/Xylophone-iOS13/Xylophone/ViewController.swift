import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(note: sender.currentTitle!)
        
        sender.layer.opacity = 0.5
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
