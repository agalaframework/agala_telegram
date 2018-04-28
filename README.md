# AgalaTelegram
Full-featured framework for writing telegram bots in Elixir. 

# Example application
Link to [repository](https://github.com/CarefreeSlacker/sandbox) simple CLI application for receiving and sending messages to telegram bot

Just:
1. `git clone https://github.com/CarefreeSlacker/sandbox`
2. `cd sandbox`
3. Create your bot by @BotFather
4. Add its token to sandbox/config/config.custom.exs into sandbox.agala_telegram.token
5. `mix deps.get`
6. `iex -S mix`
7. ?????
8. PROFIT!

Now you can send and receive messages from created Telegram bot.
1. Incoming messages will be displayed in CLI like this:    
`<User first name> <user_telegram_id> : <Message>`     
`----> You have just received message <----`   
2. For sending message you can use module `Sandbox.MessageSender.answer(<recepient user_telegram_id>, <Your message>)` and then you will see feedback:    
`<bot_name> Bot <bot_id> : <Your message>`   
`----> You have just sent message <----`

## Installation
There will be described the process of creating a bot step by step. Also pay attention to comments in code snippets.

1. Add to your mix.exs
```elixir
def deps do
  [
    {:agala_telegram, "~> 0.1.2"}
  ]
end
```

2. Create request handler
```elixir
defmodule Sandbox.RequestHandler do
  @moduledoc false

  use Agala.Chain.Builder # Add it in handler. It will allow you to use `chain` macro
  use Agala.Provider.Telegram, :handler # Specify provider.
  alias Agala.Conn

  # Chain macro. Works just like `plug` macro.
  # You can pass there module. Like here.
  chain(Agala.Provider.Telegram.Chain.Parser) 
  # Module must
  # 1. Have one `init` method with specification `@spec init(opts :: Keyword.t) :: Keyword.t`. Options will be passed to `call` function.
  # 2. Have one `call` method with specification `@spec call(conn :: Agala.Conn.t, opts :: Keyword.t) :: Agala.Conn.t`. Attention! It must return `Agala.Conn.t` function for chaining.

  # Or you can pass there current module function name
  # Function must have specification `@spec call(conn :: Agala.Conn.t, opts :: Keyword.t) :: Agala.Conn.t`
  chain(:handle)
  chain(:second_handle)

  def handle(%Conn{request: %{message: %{text: text, from: %{first_name: first_name, id: user_telegram_id}}}} = conn, _opts) do
    IO.puts("#{first_name} #{user_telegram_id} : #{text}")
    conn
  end

  def second_handle(conn, _opts) do
    IO.puts("----> You have just received message <----")
    Conn.halt(conn)
  end
end
```

3. Create your bot
You can create it by @BotFather. Just find it, type `/newbot` and follow instructions. In the end copy the token of created bot and paste it into your config file.
```elixir
config :sandbox, :agala_telegram,
  name: "sandbox_telegram_bot", # It must not strict to you telegram bot name. It's using to call specific bot.
  token: "999999999:aaaaaaaaaaaaaaaaaaaaaaaaa-aaaaaaaaa" # Nuff said
```

4. Create bot configuration
```elixir
defmodule Sandbox.BotConfig do
  alias Agala.Provider.Telegram.Conn.ProviderParams

  def get do
    %Agala.BotParams{
      name: Application.get_env(:sandbox, :agala_telegram)[:name], # You can use any string. It's using for sending message from specific bot in paragraph #6
      provider: Agala.Provider.Telegram,
      handler: Sandbox.RequestHandler, # RequestHandler from paragraph #2
      provider_params: %ProviderParams{
        token: Application.get_env(:sandbox, :agala_telegram)[:token], # Token from paragraph #3
        poll_timeout: :infinity
      }
    }
  end
end
```

5. Add Bot to your supervision tree
```elixir
{Agala.Bot, Sandbox.BotConfig.get()}
```
**You can run any number of bots. Just specify different `name` and `token` in each bot configuration.**

6. Create request sender
```elixir
defmodule Sandbox.MessageSender do
  @moduledoc """
  Module for sending messages to telegram
  """

  alias Agala.Provider.Telegram.Helpers
  alias Agala.Conn

  @bot_name Application.get_env(:sandbox, :agala_telegram)[:name] # Bot name just like in bot configuration from paragraph #4

  def answer(telegram_user_id, message) do
    # Function for sending response to bot
    Agala.response_with(
      %Conn{}
      |> Conn.send_to(@bot_name) # You must explicitly specify bot name.
      |> Helpers.send_message(telegram_user_id, message, []) # Helper function for telegram prpovider.
      |> Conn.with_fallback(&message_fallback(&1)) # Fallback after successful request sending. Pass Agala.Conn.t of finished request.
      # It is not necessary to pass fallback. It's just mechanism to make feedback after sending message.
      # For example it is necessary to display that message has been delivered. Or there could become error or something else.
    )
  end

  defp message_fallback(%Conn{fallback: %{"result" => %{"from" => %{"first_name" => first_name, "id" => id, "is_bot" => is_bot}, "text" => text}}} = _conn) do
    bot_postfix = if is_bot, do: "Bot", else: ""
    IO.puts("\n#{first_name} #{bot_postfix} #{id} : #{text}")
    IO.puts("----> You have just sent message <----")
  end
end
```
7. Download dependencies
`mix deps.get`

That's it. Now you can receive and send messages from and to telegram bot.

### Conclusion
For further information you can visit [documentation](https://hexdocs.pm/agala_telegram/api-reference.html) page in hexdocs.pm
