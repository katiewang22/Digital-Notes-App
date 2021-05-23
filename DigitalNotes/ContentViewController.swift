
import UIKit
import Vision

class ContentViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView?.text = text
        self.textView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
}

extension ContentViewController: RecognizedTextDataSource {
    func addRecognizedText(recognizedText: [VNRecognizedTextObservation]) {
        
        for observation in recognizedText {
            
            // a candidate is each recognized String (word/character/number)
            guard let candidate = observation.topCandidates(1).first else { continue }
            
            // add each candidate to the text view for the user to see
            text += candidate.string
            text += "\n"
        }
        
        textView?.text = text
    }
}
