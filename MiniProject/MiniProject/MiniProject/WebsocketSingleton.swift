import Starscream
import Alamofire
import SwiftyJSON



class WebSocketManagerSingleton: NSObject,WebSocketDelegate {
    
    static let shared = WebSocketManagerSingleton()
    
    var socket: WebSocket?
    
    private override init() {
        
            super.init()
        print("tao fi init f webscoket w bech naamel connect")
            connect()
        print("tao fi init f webscoket aamalt connect")

        }

    
    
    func connect() {
        
        print("tao  connect websocket")

        let urlString = "ws://localhost:3007"
        guard let url = URL(string: urlString) else {
            print("tao f else  connect websocket")

            return
        }

        let request = URLRequest(url: url)
        socket = WebSocket(request: request)
        socket?.delegate = self
        socket?.connect()
        
        print("tao f ekher  connect websocket")

    }
    
    func disconnect() {
        socket?.disconnect()
    }
    
    func send(message: String) {
        socket?.write(string: message)
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            
            print("Test WebSocket connected")

            
            print("WebSocket connected: \(headers)")
            
            
            
            
        case .disconnected(let reason, let code):
            print("WebSocket disconnected: \(reason) \(code)")
            
            
            
            
        case .text(let message):
            
            
            print("WebSocket received text message: \(message)")
            
            
            
            
        case .binary(let data):
            print("WebSocket received binary data: \(data)")
            
            
            
            
            
        case .ping(_):
            
            
            break
        case .pong(_):
            
            
            break
        case .viabilityChanged(_):
            
            
            
            break
        case .reconnectSuggested(_):
            
            
            
            break
        case .cancelled:
            
            
            
            break
        case .error(let error):
            print("WebSocket fama erreur")

            print("WebSocket error: \(error)")
        }
        
        
        func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
                NotificationCenter.default.post(name: Notification.Name("WebsocketDidReceiveMessage"), object: nil, userInfo: ["message": text])
            }
        
        
        
        
        func sendAll(message: String, param1: String, param2: Int) {
            // Use param1 and param2 however you need
            let data: [String: Any] = [
                "message": message,
                "param1": param1,
                "param2": param2
            ]
            
            // Convert the data to JSON and send it
            let jsonData = try? JSONSerialization.data(withJSONObject: data)
            socket?.write(data: jsonData!)
        }
        
        
        
    }
}
