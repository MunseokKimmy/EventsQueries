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
      pre {
        name = event:attr{"name"}.klog("our passed in name: ")
      }
      send_directive("say", {"something":"Hello " + name})
    }

    rule hello_monkey {
      select when echo monkey
      pre {
        name = event:attr{"name"}.klog("passed in name: ")
      }
      send_directive("say", {"something": "Hello " + hello})// || send_directive("say," {"something:": "Hello Monkey"})

    }
  }