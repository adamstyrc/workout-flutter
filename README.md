# workout_app

Workout app in Flutter with GetX architecture

## Running project

1. First execute build_runner:
> flutter pub run build_runner build

2. Then run project with:
> flutter run

## Architecture reasoning

1. Architecture.

*Clean architecture* is most correct approach for me as it's dividing app codebase into multiple layers: DataSources (remote & local), Repository. It's providing a nice and consistent way of accessing data. With Futures and Streams it's easy to implement single access or observable data.
UseCases are not mandatory though they can help managing complexity of e.g. multiple repositories usage.

2. State management
I found *GetX* to be one of most efficient state managements existing in Flutter frameworks. Developing features is rapid, and there is zero boilerplate with .obs fields. UI is detecting changes itself (thanks to Obx widget) so everything is very reactive meaning you always have latest data presented.
If not GetX, I would go for BLoC with cubits.

I also use RxDart as a nice addition for managing observable data
3. Model creation
For model creation I used *freezed* package so I get .copyWith and equals for free.

4. Persistent storage
I would use *Hive* or *get_storage* for saving workouts so they are accessible after app restarted. I didn't use them because of time limitation.
