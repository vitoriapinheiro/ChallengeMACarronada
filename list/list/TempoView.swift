



import SwiftUI

struct TempoView: View {
    @State private var timeRemaining = 600 // 10 minutos em segundos
    @State private var isTimerRunning = false
    @State private var timer: Timer?
    @State private var showTimeOptions = false
    
    var timeText = ""
    
    init(timeText: String) {
        self.timeText = timeText
    }
    
    let timeOptions = [5, 10, 15] // Opções de tempo em minutos
    @State private var selectedTime = 0
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle().foregroundColor(.red)
                VStack(alignment: .leading) {
                    ZStack {
                        Rectangle()
                        HStack {
                            Text(timeText)
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(10)
                                .cornerRadius(8)
                            Spacer()
                            Button(action: {
                                showTimeOptions = true
                            }) {
                                Text(timeString(from: timeRemaining))
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            .popover(isPresented: $showTimeOptions) {
                                menuContent
                                    .background(Color.black)
                                    .padding()
                            }
                        }
                        
                    }
                    
                    HStack {
                        ProgressView(value: Double(timeRemaining), total: Double(getTotalTime()))
                            .accentColor(.black)
                            .padding(.horizontal)
                    }
                }
            }
            .cornerRadius(8)
            
           
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
            
        }.padding(24)
        .onAppear {
            startTimer()
        }
    }
    
    var menuContent: some View {
        VStack {
            ForEach(timeOptions, id: \.self) { option in
                Button(action: {
                    setTimer(minutes: option)
                    selectedTime = option
                    showTimeOptions = false
                }) {
                    Text("\(option) minutos")
                }
                .padding()
            }
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
    
    func setTimer(minutes: Int) {
        timeRemaining = minutes * 60
    }
    
    
    func getTotalTime() -> Int {
        return selectedTime * 60;
    }

    
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}



struct TempoView_Previews: PreviewProvider {
    static var previews: some View {
        TempoView(timeText: "Alo tempo")
    }
}
