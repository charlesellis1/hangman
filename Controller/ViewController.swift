//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instances: Models
        
    var word = ""
    
    var input: UILabel?
    
    var incorrect = 0
    
    let possibleWords = Hangman()
    
  
    


    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var secretWord: UILabel!
    
    
    @IBOutlet weak var incorrectGuessed: UILabel!
    
    
    @IBOutlet weak var lastGuess: UILabel!
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var letterStack: UIStackView!
    
    
    
    // MARK: - Class Props/Vars
    
    // MARK: - IBActions
    
    
    @IBAction func guessLetter(_ sender: UIButton) {
        let guess = textField.text
        if guess == nil {
            print("Guess a letter or word")
        }
        else if guess?.count == 1 {
            if word.contains(guess!) {
                var inds = [String]()
                for i in 0...word.count {
                    if word[i] == guess![0] {
                        secretWord.text[i] = guess![0]
                    }
                }
            }
            else {
                incorrectGuessed.text! += guess!
                incorrect += 1
                hangmanImage.image = UIImage(contentsOfFile: "hangman\(incorrect - 1)")
            }
        }
        else {
            if word.elementsEqual(guess!) {
                secretWord.text = word
                endGame()
            }
        }
        lastGuess.text = guess
    }
    
    
    @IBAction func inputLetter(_ sender: UIButton) {
        input = sender.titleLabel
        textField.text = input?.text
    }
    
    
    @IBAction func clearTF(_ sender: UIButton) {
        textField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGame()
    
    }
    
    
    
    
    
    
    func setupGame() {
        word = possibleWords.wwdcArray.randomElement()!
        for _ in 0...word.count {
            secretWord.text! += "_"
        }
        incorrectGuessed.text = ""
        incorrect = 0
        lastGuess.text = ""
        hangmanImage.image = UIImage(contentsOfFile: possibleWords.imageNames[0])
    }
    

    // MARK: - Class Methods
    
    private func reset() -> Void { return }
    private func playTurn() -> Void { return }
    private func endGame() -> Void { return }

    // Optional Example Code, but might be useful...
    
    
    /* PREPARING AND PRESENTING A SEGUE (TRANSITION)
     ... { _ in
         // Segue to the high score screen
         CATransaction.setCompletionBlock({
             self.performSegue(withIdentifier: "ExampleSegue", sender: nil)
         })
     }
     
    self.present(endGameAlert, animated: true, completion: nil)
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Get the new view controller using segue.destination.
        // 2. Pass the selected object to the new view controller.
        if let dest = segue.destination as? EndGameViewController {
            dest.userScore = counter
        }
    */
    
}
