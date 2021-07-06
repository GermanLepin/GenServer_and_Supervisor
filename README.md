# GenServer and Supervisor

### В этом руководстве я испоьзовал GenServer и Supervisor и создал простое приложение для чата.   
## Запуск приложения `iex -S mix` 

## Запуск сервера чата `iex(1)> Chat.Server.start_link` - этот запрос возвращает кортеж, состоящий из атома и идентификатора процесса 

## Привязываем идентификатор процесса к PID `iex(2)> {:ok, pid}=Chat.Server.start_link`

## Вызов get_msgs(pid) `iex(3)> Chat.Server.get_msgs(pid)` возвращает пустой список, следовательно вызов работает корректно.