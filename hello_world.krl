ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Phil Windley"
    shares hello, __testing
  }
   
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }

  rule hello_world {
    select when echo hello
    send_directive("say", {"world":"Hello " + hello})
  }

  rule hello_monkey {
    select when echo monkey
    pre {
      name = event:attrs{"name"} || "Monkey".klog("our name is: ")
    }
    send_directive("Help", {"monkey":"Hello " + name})
  }

  rule hello_monkey2 {
    select when echo monkey2
    pre {
      name = event:attrs{"name"} => event:attrs{"name"}.klog("our name is: ") | "Monkey".klog("our name is: ")
    }
    send_directive("Help", {"monkey":"Hello " + name})
  }
   
}