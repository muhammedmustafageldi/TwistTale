import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var theEndLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    private var storyBrain: StoryBrain!


    override func viewDidLoad() {
        super.viewDidLoad()

        storyBrain = StoryBrain()
        
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        storyBrain.nextStory(userChoice: userChoice!)
        
        updateUI()
    }
    
    private func updateUI() {
        let currenctStory = storyBrain.getStory()
        
        storyLabel.text = currenctStory.title
        choice1Button.setTitle(currenctStory.choice1 ?? "", for: .normal)
        choice2Button.setTitle(currenctStory.choice2 ?? "", for: .normal)
        
        if storyBrain.isStoryEnded() {
            showFinish(true)
        }
    }
    
    @IBAction func tryAgain(_ sender: UIButton) {
        storyBrain.resetStory()
        showFinish(false)
        updateUI()
    }
    
    private func showFinish(_ finishedStory: Bool) {
        choice1Button.isHidden = finishedStory
        choice2Button.isHidden = finishedStory
        theEndLabel.isHidden = !finishedStory
        tryAgainButton.isHidden = !finishedStory
    }
}
