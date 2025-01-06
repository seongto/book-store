//
//  AppContainer.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import Swinject



/// 의존성 주입을 모듈화하고 분리하기 위한 DI컨테이너.
final class AppContainer {
    static let shared = AppContainer()

    private let container: Container

    private init() {
        container = Container()

        // Repository 주입
        container.register(BookEntityRepository.self) { _ in
            BookEntityRepositoryImpl()
        }

        // Use Case 주입
        container.register(RecentBooksUseCase.self) { resolver in
            RecentBooksUseCaseImpl(
                bookEntityRepository: resolver.resolve(BookEntityRepository.self)!
            )
        }
    }

    // Use Case를 외부에서 요청할 때
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
