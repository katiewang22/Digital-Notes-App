
import UIKit
import Vision

protocol RecognizedTextDataSource: AnyObject {
    func addRecognizedText(recognizedText: [VNRecognizedTextObservation]) // contains info about the location and content of text that Vision recognized in the input img
}
