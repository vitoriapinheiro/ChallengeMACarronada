//import SwiftUI
//
//struct TempoView: View {
//    @State private var timeRemaining = 600 // 10 minutos em segundos
//    @State private var isTimerRunning = false
//    @State private var timer: Timer?
//    
//    var body: some View {
//        HStack {
//            Text(timeString(from: timeRemaining))
//                .font(.largeTitle)
//                .padding()
//            
//            ZStack {
//                Circle()
//                    .stroke(Color.gray, lineWidth: 20)
//                
//                Circle()
//                    .trim(from: 0, to: CGFloat(timeRemaining) / 600)
//                    .stroke(Color.blue, lineWidth: 10)
//                    .rotationEffect(.degrees(-90))
//                
//                Button(action: {
//                    if isTimerRunning {
//                        pauseTimer()
//                    } else {
//                        startTimer()
//                    }
//                }) {
//                    Text(isTimerRunning ? Image(systemName: "pause.fill") : Image(systemName: "play.fill")
//                    
//                    
//                    )
//                        .font(.title)
////                        .padding()
////                        .background(Color.blue)
////                        .foregroundColor(.white)
////                        .cornerRadius(10)
//                }
//            }
//            .frame(width: 200, height: 200)
//            
//           
//        }
//        .onAppear {
//            startTimer()
//        }
//    }
//    
//    func startTimer() {
//        if timer == nil {
//            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//                if timeRemaining > 0 {
//                    timeRemaining -= 1
//                } else {
//                    timer?.invalidate()
//                    timer = nil
//                }
//            }
//            isTimerRunning = true
//        }
//    }
//    
//    func pauseTimer() {
//        timer?.invalidate()
//        timer = nil
//        isTimerRunning = false
//    }
//    
//    func timeString(from seconds: Int) -> String {
//        let minutes = seconds / 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//struct TempoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TempoView()
//    }
//}
//
