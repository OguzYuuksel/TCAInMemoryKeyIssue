import ComposableArchitecture

@Reducer
public struct TestReducerOptionalInt {
    @ObservableState
    public struct State: Equatable {
        @Shared var value: Int?
    }

    @CasePathable
    public enum Action {
        case set
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .set:
                state.$value.withLock { $0 = 998}
                return .run { [value = state.$value] _ in
                    try await Task.sleep(for: .milliseconds(200))
                    value.withLock { $0 = 997 }
                }
            }
        }
    }
}

@Reducer
public struct TestReducerInt {
    @ObservableState
    public struct State: Equatable {
        @Shared var value: Int
    }

    @CasePathable
    public enum Action {
        case set
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .set:
                state.$value.withLock { $0 = 998}
                return .run { [value = state.$value] _ in
                    try await Task.sleep(for: .milliseconds(200))
                    value.withLock { $0 = 997 }
                }
            }
        }
    }
}
