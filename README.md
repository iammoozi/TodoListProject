# TodoListApp 스터디

이 프로젝트는 SwiftUI를 사용하여 기본적인 Todo 리스트 앱을 구현한 스터디 결과물입니다.

## 주요 기능

- Todo 항목 추가
- Todo 항목 삭제
- Todo 항목 이동 (순서 변경)
- Todo 항목 완료 상태 토글

## 구현 세부사항

### Todo 추가
- '생성하기' 버튼을 통해 새로운 Todo 항목을 추가할 수 있습니다.
- `sheet`를 사용하여 새 Todo 입력 화면을 모달로 표시합니다.
- `NewTodoListView`에서 새 Todo 항목을 생성하고 기존 리스트에 추가합니다.

### Todo 삭제
- SwiftUI의 `onDelete` 수정자를 사용하여 스와이프로 삭제 기능을 구현했습니다.
- `removeItem` 함수를 통해 선택된 항목을 `todoItem` 배열에서 제거합니다.

### Todo 이동
- `onMove` 수정자를 사용하여 드래그 앤 드롭으로 항목 순서를 변경할 수 있습니다.
- `moveItem` 함수를 통해 `todoItem` 배열 내에서 항목의 위치를 변경합니다.

### 완료 상태 토글
- 각 Todo 항목 옆의 원형 아이콘을 탭하여 완료 상태를 토글할 수 있습니다.
- `toggleItem` 함수를 사용하여 선택된 항목의 `isCompleted` 상태를 변경합니다.

## 프로젝트 구조

- `TodoListView`: 메인 뷰로, Todo 리스트를 표시하고 관리합니다.
- `NewTodoListView`: 새로운 Todo 항목을 생성하기 위한 뷰입니다.
- `TodoModel`: Todo 항목의 데이터 모델을 정의합니다.

## 추가 개선사항

- **데이터 지속성**: CoreData 또는 UserDefaults를 사용하여 Todo 항목을 저장하고 불러오기
- **카테고리 기능**: Todo 항목을 카테고리별로 구분하고 관리하기
- **알림 기능**: 기한이 있는 Todo 항목에 대해 알림 설정하기
- **UI 개선**: 사용자 경험을 향상시키기 위한 애니메이션 및 전환 효과 추가
