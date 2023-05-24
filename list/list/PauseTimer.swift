import SwiftUI

struct PauseTimer: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var progress: CGFloat = 1.0
    @State private var isPlaying = false // Estado de reprodução do timer
    @State private var startDate = Date() // Data de início do timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            Text("\(timeString(time: timeRemaining))")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 10)
                    .opacity(0.3)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.blue, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                if isPlaying {
                    Button("Pause") {
                        pauseTimer()
                    }
                } else {
                    Button("Play") {
                        startTimer()
                    }
                }
            }
            .frame(width: 200, height: 200)
        }
        .padding(10)
        .onReceive(timer) { _ in
            if isPlaying {
                let elapsedTime = Int(Date().timeIntervalSince(startDate))
                let remainingTime = max(timeRemaining - elapsedTime, 0)
                progress = CGFloat(remainingTime) / 600.0 // Divide pelo total de segundos (10 minutos)
                timeRemaining = remainingTime
                
                if remainingTime == 0 {
                    isPlaying = false // Se o tempo acabar, interrompe a reprodução
                }
            }
        }
    }
    
    func startTimer() {
        if !isPlaying {
            startDate = Date() // Armazena a data de início do timer apenas se não estiver em execução
        }
        isPlaying.toggle()
    }
    
    func pauseTimer() {
        isPlaying = false
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct PauseTimer_Previews: PreviewProvider {
    static var previews: some View {
        PauseTimer()
    }
}
