//
//  TestReducer.swift
//  TCAInMemoryKey
//
//  Created by Oguz Yüksel on 30.01.25.
//

import ComposableArchitecture
@testable import TCAInMemoryKey
import XCTest

@MainActor
final class TestReducerTests: XCTestCase {
    // Test should have passed.
    func testReducerOptionalInt() async {
        let store = TestStore(
            initialState: TestReducerOptionalInt.State(value: Shared(wrappedValue: 999, .inMemory("\(#function)"))),
            reducer: TestReducerOptionalInt.init,
            withDependencies: { _ in }
        )

        store.assert { state in
            state.$value.withLock { $0 = 999 }
        }

        await store.send(.set) {
            $0.$value.withLock { $0 = 998 }
        }

        try? await Task.sleep(for: .milliseconds(300))

        store.assert { state in
            state.$value.withLock { $0 = 997 }
        }
    }

    func testReducerInt() async {
        let store = TestStore(
            initialState: TestReducerInt.State(value: Shared(wrappedValue: 999, .inMemory("\(#function)"))),
            reducer: TestReducerInt.init,
            withDependencies: { _ in }
        )

        store.assert { state in
            state.$value.withLock { $0 = 999 }
        }

        await store.send(.set) {
            $0.$value.withLock { $0 = 998 }
        }

        try? await Task.sleep(for: .milliseconds(300))

        store.assert { state in
            state.$value.withLock { $0 = 997 }
        }
    }
}

