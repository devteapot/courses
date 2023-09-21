import UIKit

func arrayExercise() {

    let numbers = [45, 73, 195, 53]
    
    //Write your code here
    let computedNumbers = zip(
        numbers,
        numbers[0...] + [numbers[0]]
    )
        .reduce([]) { acc, curr in
            let (n1, n2) = curr
            return acc + [n1 * n2]
        }
    
    print(computedNumbers)
}

func randomizationExercise() {
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26
    
    let password = (0...5)
        .map { _ in alphabet[Int.random(in: 0...25)] }
        .joined()
    
    print(password)
}
