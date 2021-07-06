## GenServer and Supervisor

## В этом руководстве я испоьзовал GenServer и Supervisor и создал простое приложение для чата.

### Запуск приложения `iex -S mix` 

### Запуск Supervisor процесс `Chat.Supervisor.start_link` - этот запрос возвращает кортеж, состоящий из атома и идентификатора процесса, например: `{:ok, #PID<0.159.0>}`

### Запуск Чат сервер `Chat.Server.start_link` - этот запрос возвращает кортеж, состоящий из атома и кортежа, атом опеващает об ошибке запуска, в кортеже информация, что Chat.Server уже запущен и предоставляет идентификатор процесса, например: `{:error, {:already_started, #PID<0.160.0>}}`

### Вызов get_msgs `Chat.Server.get_msgs` возвращает пустой список, следовательно вызов работает корректно.

### У каждого процецесса есть своий идентификатор (PID), следовательно, в сообщение нужно передать всего один аргумет, непосредственно сам текст сообщения: `Chat.Server.add_msg "Hello! How are you?"` Возврат атома `:ok`, говорит, о том, что текст сообщения добавлен.

### Вызов get_msgs `Chat.Server.get_msgs` вернет список с текстом добавленного сообщения `["Hello! How are you?"]`

### Для поиска идентификаторго процесса можно использовать функцию `Process.whereis()` указав в скобках чей PID нужен: `Process.whereis(:chat_room)` и этот вызов вернет PID, например: `#PID<0.139.0>`

### Зная расположение PID можно воспользоваться функцией выхода из процесса и передать ей уничтожающий атом, чтобы убить/прервать процесс `Process.exit(:kill)`  сам запрос будет выглядить так:`Process.whereis(:chat_room) |> Process.exit(:kill)`

### При вызове функции выхода возвращается ответ true, но если захотеть проверить, есть ли он и где находится `Process.whereis(:chat_room)` в ответ будет получен абсолютно новвый PID `#PID<0.146.0>`
