defmodule Chat.Server do
  use GenServer

  #запуск с клиентской стороны 

  def start_link do
    GenServer.start_link(__MODULE__, []) #здесь __MODULE__ означает defmodule Chat.Server
  end

  # messages = msgs
  def get_msgs(pid) do
    GenServer.call(pid, :get_msgs)
  end

  #запуск со стороны сервера/ функция обратного вызова

  def init(msgs) do
    {:ok, msgs}
  end

  def handle_call(:get_msgs, _form, msgs) do
    {:reply, msgs, msgs}
  end


end
