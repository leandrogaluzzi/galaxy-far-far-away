import Foundation

public enum ReduxDebugMode {
    case noDebug
    case verboseLimited(depth: Int)
    case verbose
}
