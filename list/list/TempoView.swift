



import SwiftUI

struct TempoView: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(timeString(from: timeRemaining))
                .font(.largeTitle)
                .foregroundColor(.black)
            
            // .frame(width: 50, height: 50)
            
            HStack {
                ProgressView(value: Double(timeRemaining), total: 600)
                    .accentColor(.black)
                    .padding(.horizontal)
                    .frame(width: 326)
            }
            
        }
        HStack {
            Button(action: {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }) {
                Image(systemName: isTimerRunning ? "pause.fill" : "play.fill")
                    .font(.title)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 43, height: 88)
            .background(Color.orange)
        }
        
        
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer?.invalidate()
                    timer = nil
                }
            }
            isTimerRunning = true
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


struct TempoView_Previews: PreviewProvider {
    static var previews: some View {
        TempoView()
    }
}
