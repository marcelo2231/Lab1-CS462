ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Marcelo Archiza"
    logging on
    shares hello
  }
  
  global {
    hello = function(obj) {
      msg = "Hello " + obj.defaultTo("Monkey!");
      msg
    }
  }
  
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }
  rule hello_monkey {
    select when echo monkey
    pre {
      name = event:attr("name").klog("our passed in name: ").defaultsTo("Monkey")
    }
    send_directive("say", {"something":"Hello " + name})
  }
  rule hello_chair {
    select when echo chair
    pre {
      (name) = (event:attr("name").klog("our passed in name: ")) => event:attr("name") | "Chair"
    }
    send_directive("say", {"something":"Hello " + name})
  }
}